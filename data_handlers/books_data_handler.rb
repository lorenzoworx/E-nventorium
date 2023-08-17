require 'json'
require_relative '../classes/book'
require_relative '../classes/label'

class SaveBooks
  FILE_PATH = 'data/books.json'.freeze

  def self.write(books)
    File.write(FILE_PATH, JSON.pretty_generate({ 'Books' => books.map do |book|
      {
        'publisher' => book.publisher,
        'publish date' => book.publish_date.to_s,
        'label_title' => book.label.title,
        'label_color' => book.label.color,
        'cover_state' => book.cover_state,
        'archived' => book.archived
      }
    end }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    books_data = JSON.parse(File.read(FILE_PATH))
    books_list = []
    books_data['Books'].each do |book_data|
      publisher = book_data['publisher']
      publish_date = book_data['publish date']
      label_title = book_data['label_title']
      label_color = book_data['label_color']
      cover_state = book_data['cover_state'] # Update this line
      archived = book_data['archived']

      book = Book.new(publish_date, archived, publisher, cover_state)
      label = Label.new(label_title, label_color)
      book.add_label(label)
      books_list << book
    end
    books_list
  end
end
