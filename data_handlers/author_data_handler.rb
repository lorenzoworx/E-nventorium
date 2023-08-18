require_relative '../classes/author'
require_relative '../classes/item'
require 'json'

class AuthorDataHandler
  FILE_PATH = './data/authors.json'.freeze

  def self.write(authors)
    authors_data = authors.map do |author|
      {
        'firstname' => author.firstname,
        'lastname' => author.lastname,
        'id' => author.id,
        'items' => author.items.map(&:id) # Store the IDs of associated items
      }
    end

    File.write(FILE_PATH, JSON.pretty_generate({ 'authors' => authors_data }))
  end

  def self.read
    return [] unless File.exist?(FILE_PATH)

    authors_data = JSON.parse(File.read(FILE_PATH))
    authors_data['authors'].map do |author_data|
      author = Author.new(author_data['firstname'], author_data['lastname'])
      author.id = author_data['id']

      author_data['items'].each do |item_id| # Retrieve associated items by their IDs
        item = Item.find_by_id(item_id)
        author.add_item(item) if item
      end

      author
    end
  end
end
