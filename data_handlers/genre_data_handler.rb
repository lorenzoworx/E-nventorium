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
      id = genre_data['id']
      genre_name = genre_data['name']
      genres_list << Genre.new(genre_data)
    end
    genres_list
  end
end