require_relative '../classes/genre'
require_relative '..classes/item'

describe Genre do
  describe 'tests for Genre class' do
    before(:each) do
      @new_item = Item.new(1, '2023-08-14', false)
      @new_genre = Genre.new(id: 1, name: 'rap')
      @instance_genre = instance_double(Genre)
    end

    context "when creating a new 'Genre'" do
      it "should create an instance of 'Genre'" do
        expect(@new_genre).to be_an_instance_of(Genre)
      end

      it "should have a valid 'id'" do
        expect(@new_genre.id).to be_an_instance_of(Integer)
        expect(@new_genre.id.nil?).to eq(false)
      end

      it "should have a valid 'name'" do
        expect(@new_genre.name.nil?).to eq(false)
        expect(@new_genre.name).to eq('rap')
      end
    end

    context '#add_item method' do
      it "should receive an 'Item' instance as input" do
        allow(@instance_genre).to receive(:add_item).with(instance_of(Item)).exactly(1)
        @instance_genre.add_item(@new_item)
      end

      it "should add the input 'Item' to the array of items" do
        @instance_genre.add_item(new_item)
        expect(@instance_genre.items.include?(@new_item)).to eq(true)
      end

      it "should add 'self' as a property of the item object" do
        @instance_genre.add_item(@new_item)
        expect(@new_item.genre).to eq(@new_genre)
      end
    end
  end
end
