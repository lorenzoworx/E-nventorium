require_relative '../classes/author'
require_relative '../classes/item'
require 'json'

class AuthorDataHandler
  FILE_PATH = './data/authors.json'.freeze

  def self.write(authors)
    authors_data = authors.map do |author|
      {
        'id' => author.id,
        'firstname' => author.firstname,
        'lastname' => author.lastname
      }
    end

    File.write(FILE_PATH, JSON.pretty_generate({ 'authors' => authors_data }))
  end

  def self.read
    file_path = './data/authors.json'
    return [] unless File.exist?(file_path)

    authors_data = JSON.parse(File.read(file_path))
    authors_list = []

    authors_data['authors'].each do |author_data|
      author_data['id']
      author_data['firstname']
      author_data['lastname']
      authors_list << Author.new(author_data['firstname'], author_data['lastname'])
    end
    authors_list
  end
end
