require 'json'
require_relative '../classes/music_album'
require_relative '../classes/genre'

class SaveMusicAlbums
  FILE_PATH = 'data/music_album.json'.freeze

  def self.write(albums)
    File.write(FILE_PATH, JSON.pretty_generate({ 'Albums' => Albums.map do |album|
      {
        'ID' => album.id,
        'publish date' => album.publish_date.to_s,
        'genre' => album.genre.name,
        'archived' => album.archived
      }
    end }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    albums_data = JSON.parse(File.read(FILE_PATH))
    albums_list = []
    albums_data['Albums'].each do |album_data|
      album_data['id']
      publish_date = album_data['publish date']
      genre = album_data['genre']
      album_data['archived']

      album = Album.new(publish_date:, on_spotify)
      genre = Genre.new(name)
      album.add_genre(genre)
      albums_list << book
    end
    albums_list
  end
end