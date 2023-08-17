require_relative 'classes/game'
require_relative 'classes/item'
require_relative 'classes/author'

class App
  OPTIONS = {
    '1' => :list_all_books,
    '2' => :list_all_music_albums,
    '3' => :list_all_movies,
    '4' => :list_all_games,
    '5' => :list_all_genres,
    '6' => :list_all_labels,
    '7' => :list_all_authors,
    '8' => :list_all_sources,
    '9' => :add_a_book,
    '10' => :add_a_music_album,
    '11' => :add_a_game
  }.freeze

  def initialize
    @authors = []
    @games = []
  end

  def run(option)
    send(OPTIONS[option])
  end

  def list_all_books
    puts 'List of books'
  end

  def list_all_music_albums
    puts 'List of music albums'
  end

  def list_all_movies
    puts 'List of movies'
  end

  def list_all_games
    puts 'List of games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}. #{game.title} (#{game.multiplayers} players), Last Played: #{game.lastplayed_date}"
    end
  end

  def list_all_genres
    puts 'List of genres'
  end

  def list_all_labels
    puts 'List of labels'
  end

  def list_all_authors
    puts 'List of authors:'
    @authors.each do |author|
      puts "#{author.firstname} #{author.lastname} (ID: #{author.id})"
      author.items.each do |item|
        if item.is_a?(Game)
          puts " - Game: #{item.title} (Players: #{item.multiplayers}), Last Played: #{item.lastplayed_date}"
          # Add similar logic for other item types (books, music albums, etc.)
        end
      end
    end
  end

  def list_all_sources
    puts 'List of sources'
  end

  def add_a_book
    puts 'Add a new book'
  end

  def add_a_music_album
    puts 'Add a new music album'
  end

  def add_game(game)
    @games << game
  end

  def find_or_create_author(firstname, lastname)
    existing_author = @authors.find { |author| author.firstname == firstname && author.lastname == lastname }
    if existing_author
      existing_author
    else
      new_author = Author.new(firstname, lastname)
      @authors << new_author
      new_author
    end
  end

  def add_a_game
    puts 'Add a new game'
    print 'Enter the game title: '
    game_title = gets.chomp

    print 'Enter the publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Enter the number of players: '
    num_players = gets.chomp.to_i

    print 'Enter the last played date (YYYY-MM-DD): '
    last_played_date = gets.chomp

    new_game = Game.new(game_title, publish_date, false, num_players, last_played_date)
    add_game(new_game)

    puts 'Add a new author'
    print 'Enter the author\'s first name: '
    firstname = gets.chomp
    print 'Enter the author\'s last name: '
    lastname = gets.chomp

    existing_author = find_or_create_author(firstname, lastname)
    existing_author.add_item(new_game)
    new_game.author = existing_author

    puts "Added #{new_game.title} to the list of games by #{existing_author.firstname} #{existing_author.lastname}."
  end
end
