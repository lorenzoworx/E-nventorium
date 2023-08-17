require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @genre = nil
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  private

  def years_since_publish_date
    current_date = Date.today
    publish_date = Date.parse(@publish_date)
    current_date.year - publish_date.year
  end

  def can_be_archived?
    years_difference = years_since_publish_date
    years_difference >= 10
  end
end
