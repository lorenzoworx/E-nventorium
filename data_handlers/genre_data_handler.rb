require 'json'
require_relative '../classes/genre'

class SaveGenres
  def self.write(genres)
    File.write('./data/genres.json', JSON.pretty_generate({ 'genres' => genres.map do |genre|
      {
        'id' => genre.id,
        'name' => genre.name
      }
    end }))
  end

  def self.read
    file_path = './data/genres.json'
    return [] unless File.exist?(file_path)

    genres_data = JSON.parse(File.read(file_path))
    genres_list = []

    genres_data['genres'].each do |genre_data|
      genre = Genre.new(genre_data['name'])
      genre.instance_variable_set(:@id, genre_data['id']) # Set the id directly, as it's a read-only attribute
      genres_list << genre
    end
    genres_list
  end
end
