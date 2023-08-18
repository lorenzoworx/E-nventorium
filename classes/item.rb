require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :source, :label
  attr_accessor :publish_date

  @@items = []

  def initialize(id, publish_date, archived)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = archived || false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def self.find_by_id(id)
    @@items.find { |item| item.id == id }
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
