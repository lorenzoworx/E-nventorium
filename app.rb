require_relative 'classes/book'
require_relative 'classes/music_album'
require_relative 'classes/game'

require_relative 'classes/author'
require_relative 'classes/label'
require_relative 'classes/genre'

require_relative 'data_handlers/game_data_handler'
require_relative 'data_handlers/author_data_handler'
require_relative 'data_handlers/books_data_handler'
require_relative 'data_handlers/labels_data_handler'
require_relative 'data_handlers/albums_data_handler'
require_relative 'data_handlers/genre_data_handler'

class App
  attr_accessor :books, :music_albums, :labels, :genres, :games, :authors

  def initialize()
    @games = DataHandlerGame.read
    @authors = AuthorDataHandler.read
    @books = SaveBooks.read
    @labels = SaveLabels.read
    @genres = SaveGenres.read
    @music_albums = SaveMusicAlbums.read
  end

  OPTIONS = {
    '1' => :list_all_books,
    '2' => :list_all_music_albums,
    '3' => :list_all_games,
    '4' => :list_all_genres,
    '5' => :list_all_labels,
    '6' => :list_all_authors,
    '7' => :add_a_book,
    '8' => :add_a_music_album,
    '9' => :add_a_game
  }.freeze

  def run(option)
    send(OPTIONS[option])
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books yet..'
    else
      @books.each do |book|
        puts "ID: #{book.id} | Publisher: #{book.publisher} | Publish Date: #{book.publish_date} | Label title: #{book.label.title} | Label color: #{book.label.color} | Archived: #{book.archived}"
      end
    end
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

  def list_all_games
    if @games.empty?
      puts 'There are no games yet..'
    else
      @games.each do |game|
        puts "ID: #{game.id} | Title: #{game.title} | Publish Date: #{game.publish_date} | Author first Name: #{game.author.firstname} | Author first Name: #{game.author.lastname} | Archived: #{game.archived}"
      end
    end
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
    if @labels.empty?
      puts 'There are no labels yet..'
    else
      @labels.each do |label|
        puts "Label ID: #{label.id} | Label title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'There are no Authors yet..'
    else
      @authors.each do |author|
        puts "Author ID: #{author.id} | Author first name: #{author.firstname} | Author last name: #{author.lastname}"
      end
    end
  end

  def add_a_book
    puts 'Add publish date of the book [Format (YYYY/MM/DD)]'
    publish_date = gets.chomp
    puts 'Add book publisher'
    publisher = gets.chomp
    puts 'Add book cover state'
    cover_state = gets.chomp
    puts 'Add book label title'
    label_title = gets.chomp
    puts 'Add book label color'
    label_color = gets.chomp

    book = Book.new(publish_date, publisher, cover_state)
    book.move_to_archive
    my_label = Label.new(label_title, label_color)
    book.add_label(my_label)
    my_label.add_item(book)
    @books << book
    @labels << my_label
    SaveBooks.write(@books)
    SaveLabels.write(@labels)
    puts 'Book created successfully!'
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
    puts 'Add publish date of the book [Format (YYYY/MM/DD)]'
    publish_date = gets.chomp
    puts 'Add game title'
    title = gets.chomp
    puts 'How many players are you?'
    multiplayers = gets.chomp.to_i
    puts 'Add publish date of the book [Format (YYYY/MM/DD)]'
    lastplayed_date = gets.chomp
    puts 'Add author first name'
    firstname = gets.chomp
    puts 'Add author last name'
    lastname = gets.chomp

    game = Game.new(publish_date, title, multiplayers, lastplayed_date)
    game.move_to_archive
    my_author = Author.new(firstname, lastname)
    game.add_author(my_author)
    my_author.add_item(game)
    @games << game
    @authors << my_author
    DataHandlerGame.write(@games)
    AuthorDataHandler.write(@authors)
    puts 'Game created successfully!'
  end
end
