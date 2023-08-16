require_relative 'classes/book'
require_relative 'classes/label'

class App
  attr_accessor :books, :labels

  def initialize()
    @books = []
    @labels = []
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
    if @books.empty?
      puts 'There are no books yet..'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher} | Publish Date: #{book.publish_date} | Label title: #{book.label.title} | Label color: #{book.label.color} | Archived: #{book.archived}"
      end
    end
  end

  def list_all_music_albums
    puts 'List of music albums'
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
    if @labels.empty?
      puts 'There are no labels yet..'
    else
      @labels.each do |label|
        puts "Label title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def list_all_authors
    puts 'List of authors'
  end

  def list_all_sources
    puts 'List of sources'
  end

  def add_a_book
    puts 'Add publish date of the book [Format (YYYY/MM/DD)]'
    publish_date = gets.chomp
    puts 'archive the book (Y/N)'
    archived = gets.chomp
    puts 'Add book publisher'
    publisher = gets.chomp
    puts 'Add book cover state'
    cover_state = gets.chomp
    puts 'Add book label title'
    label_title = gets.chomp
    puts 'Add book label color'
    label_color = gets.chomp

    if %w[Y y].include?(archived)
      archived_value = true
    elsif %w[N n].include?(archived)
      archived_value = false
    end

    book = Book.new(publish_date, archived_value, publisher, cover_state)
    my_label = Label.new(label_title, label_color)
    book.add_label(my_label)
    my_label.add_item(book)
    @books << book
    @labels << my_label
    puts 'Book created successfully!'
  end

  def add_a_music_album
    puts 'Add a new music album'
  end

  def add_a_game
    puts 'Add a new game'
  end
end
