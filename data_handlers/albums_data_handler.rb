require 'json'
require_relative '../classes/music_album'
require_relative '../classes/genre'

class SaveMusicAlbums
  FILE_PATH = 'data/music_album.json'.freeze

  def self.write(albums)
    File.write(FILE_PATH, JSON.pretty_generate({ 'Albums' => albums.map do |album|
      {
        'ID' => album.id,
        'publish date' => album.publish_date.to_s,
        'genre' => album.genre.name,
        'archived' => album.archived,
        'On spotify' => album.on_spotify
      }
    end }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    albums_data = JSON.parse(File.read(FILE_PATH))
    albums_list = []
    albums_data['Albums'].each do |album_data|
      publish_date = album_data['publish date']
      genre = album_data['genre']
      album_data['archived']
      on_spotify = album_data['On spotify']

      album = MusicAlbum.new(publish_date, on_spotify)
      my_genre = Genre.new(genre)
      album.add_genre(my_genre)
      album.move_to_archive
      albums_list << album
    end
    albums_list
  end
end
