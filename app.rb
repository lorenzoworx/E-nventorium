require_relative 'classes/music_album'
require_relative 'classes/genre'

class App
  attr_accessor :genre, :music_album

  def initialize()
    @music_albums = []
  end
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

  def run(option)
    send(OPTIONS[option])
  end

  def list_all_books
    puts 'List of books'
  end

  def list_all_music_albums
    
    if @music_albums.empty?
      puts "There are no music albums yet. Go ahead and add some albums"
    else
      @music_albums.each_with_index do |music_album, index|
        genre_name = music_album.genre ? music_album.genre.name : 'N/A'
        puts "#{index}) on_spotify: #{music_album.on_spotify}, Publish Date: #{music_album.publish_date} Genre: #{genre_name}"
      end

    end

  end

  def list_all_movies
    puts 'List of movies'
  end

  def list_all_games
    puts 'List of games'
  end

  def list_all_genres
    puts 'List of genres'
  end

  def list_all_labels
    puts 'List of labels'
  end

  def list_all_authors
    puts 'List of authors'
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

  def add_a_game
    puts 'Add a new game'
  end
end
