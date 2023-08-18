class Genre
  attr_reader :items, :id
  attr_accessor :name

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    items << item unless @items.include?(item) # To skip repeated items
  end
end
