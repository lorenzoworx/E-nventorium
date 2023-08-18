require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'data_handlers/albums_data_handler'
require_relative 'data_handlers/genre_data_handler'

class App
  attr_accessor :genres, :music_albums

  def initialize()
    @genres = SaveGenres.read
    @music_albums = SaveMusicAlbums.read
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
      puts 'There are no music albums yet. Go ahead and add some albums..'
    else
      @music_albums.each do |album|
        puts "ID: #{album.id} | Publish Date: #{album.publish_date} | Genre name: #{album.genre.name} | Archived: #{album.archived} | On spotify: #{album.on_spotify}"
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
      puts 'There are no Genres yet..'
    else
      @genres.each do |genre|
        puts "Genre ID: #{genre.id} | Genre name: #{genre.name}"
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
    puts 'Enter the album publish date in the format: (YYYY/MM/DD)'
    publish_date = gets.chomp
    puts 'Add the album genre'
    genre_name = gets.chomp

    puts 'Is the music album on spotify? [Y/N]'
    on_spotify_truth = gets.chomp
    if %w[y Y].include?(on_spotify_truth)
      on_spotify = true
    elsif %w[n N].include?(on_spotify_truth)
      on_spotify = false
    end

    music_album = MusicAlbum.new(publish_date, on_spotify)
    music_album.move_to_archive
    my_genre = Genre.new(genre_name)
    music_album.add_genre(my_genre)
    @music_albums << music_album
    @genres << my_genre
    SaveMusicAlbums.write(@music_albums)
    SaveGenres.write(@genres)
    puts 'Music album added successfully'
  end

  def add_a_game
    puts 'Add a new game'
  end
end
