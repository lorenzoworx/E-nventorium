require_relative '../classes/music_album'
require_relative '..classes/genre'

describe MusicAlbum do
  describe "Tests for 'MusicAlbum' class" do
    before(:each) do
      @test_album = MusicAlbum.new(on_spotify: false, archived: false, publish_date: Date.today)
      @test_genre = Genre.new(id: 1, name: 'rap')
      @instance_genre = instance_double(Genre)
    end

    context "when creating a new 'MusicAlbum' object" do
      it "should create an instance of 'MusicAlbum' class" do
        expect(@test_album).to be_an_instance_of(MusicAlbum)
      end

      it "should be a kind of 'Item'" do
        expect(@test_album).to be_kind_of(Item)
      end
    end

    context "When creating a new 'MusicAlbum'" do
      it "should have a valid 'id'" do
        expect(@test_album.id).to be_an_instance_of(Integer)
        expect(@test_album.id.nil?).to eq(false)
      end

      it "should have a valid 'publish_date' value" do
        expect(@test_album.publish_date.nil?).to eq(false)
        expect(@test_album.publish_date).to be_a(Date)
      end

      it "should have a valid 'on_spotify' value" do
        expect(@test_album.on_spotify.nil?).to eq(false)
        expect(@test_album.on_spotify).to be_boolean
      end

      it "should have a valid 'genre' value" do
        @test_genre.add_item(@test_album)
        expect(@test_album.genre).to be_kind_of(Genre)
        expect(@test_album.genre).not_to be_nil
      end
    end

    context 'can_be_archived? method' do
      it 'should exist' do
        expect(@test_album.private_methods(:can_be_archived?)).to be_truthy
      end

      context "should retrun 'true' if " do
        album1 = MusicAlbum.new(publish_date: '2005-08-16', on_spotify: true, archived: true)
        album2 = MusicAlbum.new(publish_date: '2022-08-16', on_spotify: false, archived: false)

        it "parent's method return's true and 'on_spotify' also true" do
          expect(album1.send(:can_be_archived?)).to be_truthy
        end

        it 'should retrun false otherwise' do
          expect(album2.send(:can_be_archived?)).to be_falsy
        end
      end
    end
  end
end
