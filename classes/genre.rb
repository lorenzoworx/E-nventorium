require_relative 'item'

class Genre
  attr_reader :name, :id
  attr_accessor :items, :genre

  def initialize(name:, id: nil)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_item=(item)
    item.genre = self
    @items << item
  end
end
