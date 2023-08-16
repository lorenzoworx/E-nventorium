require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :label

  def initialize(publish_date, archived)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = archived || false
    @label = nil
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_label(label)
    @label = label
    label.add_item(self)
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
