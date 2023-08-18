require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'creates a new MusicAlbum instance with publish date and on_spotify' do
      album = MusicAlbum.new('2023/08/18', true)
      expect(album.publish_date).to eq('2023/08/18')
      expect(album.on_spotify).to be_truthy
    end
  end

  describe '#can_be_archived?' do
    context 'when album can be archived' do
      it 'returns true if years since publish date is 10 or more and on_spotify is true' do
        album = MusicAlbum.new('2010/01/01', true)
        allow(album).to receive(:years_since_publish_date).and_return(10)
        expect(album.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when album cannot be archived' do
      it 'returns false if years since publish date is less than 10 or on_spotify is false' do
        album = MusicAlbum.new('2022/01/01', false)
        allow(album).to receive(:years_since_publish_date).and_return(9)
        expect(album.send(:can_be_archived?)).to be_falsy
      end
    end
  end
end
