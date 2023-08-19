require_relative '../classes/label'
require_relative '../classes/item'

RSpec.describe Label do
  let(:title) { 'my label Title' }
  let(:color) { 'Red' }
  subject(:label) { Label.new(title, color) }

  describe 'initialize' do
    it 'assigns title and color attributes' do
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
    end

    it 'assigns a random ID' do
      expect(label.id).to be_a(Integer)
    end

    it 'initializes an empty array for items' do
      expect(label.items).to be_empty
    end

    it 'uses default color if not provided' do
      label_without_color = Label.new(title)
      expect(label_without_color.color).to eq('green')
    end
  end

  describe '#add_item' do
    let(:item) { instance_double(Item) }

    it 'adds an item to the items array' do
      expect(item).to receive(:label=).with(label)
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'does not add the same item twice' do
      expect(item).to receive(:label=).with(label).exactly(2).times
      label.add_item(item)
      label.add_item(item)
      expect(label.items.count(item)).to eq(1)
    end
  end
end
