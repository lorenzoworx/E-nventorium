require 'json'
require_relative '../classes/genre'
require_relative '../classes/music_album'

module SaveMusicAlbums
  FILE_PATH = 'data/music_albums.json'.freeze

  def save_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_music
    save_music_albums
    save_genres
  end

  def save_music_albums
    json_data = @music_albums.map(&:to_hash)
    save_file(FILE_PATH, json_data)
  end

  def load_file(file_name)
    data = File.read(file_name)
    JSON.parse(data)
  end

  def load_music_albums
    music_albums_hash = []
    return music_albums_hash unless File.exist?(FILE_PATH)

    music_albums_hash = load_file(FILE_PATH)
    music_albums_hash.each do |music_album|
      music_obj = MusicAlbum.new(publish_date: music_album['publish_date'], on_spotify: music_album['on_spotify'],
                                 id: music['id'])
      genre_obj = @genres.find { |genre| genre.name == music_album['genre'] }
      music_obj.add_genre(genre_obj)
      @music_albums << music_obj
    end
  end
end
