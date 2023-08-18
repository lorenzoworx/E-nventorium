require 'json'
require_relative 'game'

class DataHandler
  FILENAME = 'games.json'.freeze

  def self.load_data
    return [] unless File.exist?(FILENAME)

    json_data = File.read(FILENAME)
    games_data = JSON.parse(json_data, symbolize_names: true)
    games_data.map do |game_data|
      Game.new(
        game_data[:id],
        game_data[:title],
        game_data[:publish_date],
        game_data[:archived],
        game_data[:multiplayers],
        game_data[:lastplayed_date]
      )
    end
  end

  def self.save_data(games)
    games_data = games.map do |game|
      {
        id: game.id,
        title: game.title,
        publish_date: game.publish_date,
        archived: game.archived,
        multiplayers: game.multiplayers,
        lastplayed_date: game.lastplayed_date
      }
    end

    File.write(FILENAME, JSON.pretty_generate(games_data))
  end
end
