require 'json'
require_relative '../classes/game'
require_relative '../classes/author'

class DataHandlerGame
  FILE_PATH = './data/games.json'.freeze

  def self.write(games)
    games_data = games.map do |game|
      {
        'title' => game.title,
        'multiplayers' => game.multiplayers,
        'lastplayed_date' => game.lastplayed_date,
        'id' => game.id,
        'publish_date' => game.publish_date,
        'archived' => game.archived,
        'author_id' => game.author&.id
      }
    end

    File.write(FILE_PATH, JSON.pretty_generate({ 'games' => games_data }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    games_data = JSON.parse(File.read(FILE_PATH))
    games_data['games'].map do |game_data|
      game = Game.new(
        game_data['id'],
        game_data['title'],
        game_data['publish_date'],
        game_data['archived'],
        game_data['multiplayers'],
        game_data['lastplayed_date']
      )

      game.id = game_data['id']
      author_id = game_data['author_id']
      game.author = Author.find_by_id(author_id) if author_id

      game
    end
  end
end
