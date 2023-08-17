require 'json'
require_relative '../classes/genre'

module SaveGenres
  FILE_PATH = 'data/genres.json'.freeze

  def save_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_genres
    json_data = @genres.map(&:to_hash)
    save_file(FILE_PATH, json_data)
  end
  
  def load_file(file_name)
    data = File.read(file_name)
    JSON.parse(data)
  end

  def load_genres
    genre_hash = []
    return genre_hash unless File.exist? (FILE_PATH)

    genre_hash = load_file(FILE_PATH)
    genre_hash.each do |genre|
      genre_obj = Genre.new(name: genre['name'], id: genre['id'])
      @genres << genre_obj
    end
  end
  
end