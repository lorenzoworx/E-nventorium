require 'json'
require_relative '../classes/author'
require_relative '../classes/item'

class DataHandler
  AUTHORS_FILE = 'authors.json'.freeze

  def self.load_authors
    return [] unless File.exist?(AUTHORS_FILE)

    json_data = File.read(AUTHORS_FILE)
    authors_data = JSON.parse(json_data, symbolize_names: true)
    authors_data.map do |author_data|
      author = Author.new(
        author_data[:id],
        author_data[:firstname],
        author_data[:lastname]
      )

      author_data[:items]&.each do |item_id|
        item = Item.find_by_id(item_id)
        author.add_item(item) if item
      end

      author
    end
  end

  def self.save_authors(authors)
    authors_data = authors.map do |author|
      {
        id: author.id,
        firstname: author.firstname,
        lastname: author.lastname,
        items: author.items.map(&:id)
      }
    end

    File.write(AUTHORS_FILE, JSON.pretty_generate(authors_data))
  end
end
