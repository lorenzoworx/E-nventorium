require_relative 'classes/music_album'
require_relative 'classes/genre'

class App
  attr_accessor :genre, :music_album

  def initialize()
    @genres = []
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
   
    if @genres.empty?
      puts "There are no genres yet. Go ahead and add some"
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Genre Name: #{genre.name}"
      end
    
    end

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
    puts "Enter the album publish date in the format: (YYYY/MM/DD)"
    publish_date = gets.chomp
    input_on_spotify = set_on_spotify
    music_album = MusicAlbum.new(publish_date: publish_date, on_spotify: input_on_spotify)
    genre = add_genre
    music_album.add_genre(genre)
    @music_albums << music_album
    puts "Music album added successfully"
  end

  def add_a_game
    puts 'Add a new game'
  end

  private
  
  def set_on_spotify
    puts "Is the music album on spotify? Press '1' for true and '2' for false"
    on_spotify = gets.chomp.to_i
    while on_spotify.nil? || on_spotify < 1 || on_spotify > 2
      puts 'input number between 1 and 2'
      on_spotify = gets.chomp.to_i
    end
    on_spotify == 1
  end

  def add_genre
    puts "Enter genre name"
    input = gets.chomp
    return_genre(input)
  end

  def return_genre(input)
    @genres.each_with_inded do |genre, index|
      return genre if genre.name == input
    end
    new_genre = Genre.new(name: input)
    @genres << new_genre
  end

end
