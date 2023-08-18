require 'json'
require_relative '../classes/author'

class DataHandlerAuthor
  FILE_PATH = './data/authors.json'.freeze

  def self.write(authors)
    authors_data = authors.map do |author|
      {
        'id' => author.id,
        'firstname' => author.firstname,
        'lastname' => author.lastname,
        'items' => author.items.map(&:id)
      }
    end

    File.write(FILE_PATH, JSON.pretty_generate({ 'authors' => authors_data }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    authors_data = JSON.parse(File.read(FILE_PATH))
    authors_data['authors'].map do |author_data|
      author = Author.new(
        author_data['firstname'],
        author_data['lastname']
      )

      author_data['items']&.each do |item_id|
        item = Item.find_by_id(item_id)
        author.add_item(item) if item
      end

      author
    end
  end
end
