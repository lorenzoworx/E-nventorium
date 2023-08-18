require_relative '../classes/genre'
require_relative '../classes/item'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new Genre instance with name and id' do
      genre = Genre.new('Rock')
      expect(genre.name).to eq('Rock')
      expect(genre.id).to be_an(Integer)
    end
  end

  describe '#add_item' do
    it "adds an item to the genre's items list" do
      genre = Genre.new('Pop')
      item = Item.new('2023/08/18')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it "sets the item's genre to the current genre" do
      genre = Genre.new('Electronic')
      item = Item.new('2023/08/18')
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end

    it 'does not add the same item multiple times' do
      genre = Genre.new('Jazz')
      item = Item.new('2023/08/18')
      2.times { genre.add_item(item) }
      expect(genre.items.size).to eq(1)
    end
  end
end
