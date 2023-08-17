class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color = 'green')
    @id = rand(1..1000)
    @items = []
    @title = title
    @color = color
  end

  def add_item(item)
    items << item unless @items.include?(item) # To skip repeated items
  end
end
