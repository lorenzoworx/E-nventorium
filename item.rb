require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date

  def initialize(_id, publish_date)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    years_difference = years_since_publish_date
    years_difference >= 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  attr_writer :genre, :author, :source, :label

  private

  def years_since_publish_date
    current_date = Date.today
    publish_date = Date.parse(@publish_date)
    current_date.year - publish_date.year
  end
end
