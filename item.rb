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
    !@archived
  end

  def move_to_archive
    @archived = true
  end

  attr_writer :genre, :author, :source, :label
end
