require_relative '../classes/game'
require_relative '../classes/author'
require 'json'

class DataHandlerGame
  FILE_PATH = './data/games.json'.freeze

  def self.write(games)
    games_data = games.map do |game|
      {
        'id' => game.id,
        'publish_date' => game.publish_date,
        'title' => game.title,
        'author_first_name' => game.author.firstname,
        'author_last_name' => game.author.lastname,
        'multiplayers' => game.multiplayers,
        'lastplayed_date' => game.lastplayed_date,
        'archived' => game.archived
      }
    end

    File.write(FILE_PATH, JSON.pretty_generate({ 'games' => games_data }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    games_data = JSON.parse(File.read(FILE_PATH))
    games_list = []
    games_data['games'].each do |game_data|
      game_data['id']
      publish_date = game_data['publish_date']
      title = game_data['title']
      author_first_name = game_data['author_first_name']
      author_last_name = game_data['author_last_name']
      multiplayers = game_data['multiplayers']
      lastplayed_date = game_data['lastplayed_date']
      game_data['archived']

      game = Game.new(publish_date, title, multiplayers, lastplayed_date)
      author = Author.new(author_first_name, author_last_name)
      game.add_author(author)
      games_list << game
    end
    games_list
  end
end
