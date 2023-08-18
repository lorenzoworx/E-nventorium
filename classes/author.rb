class Author
  attr_reader :id, :firstname, :lastname
  attr_accessor :items


  def initialize(firstname, lastname)
    @id = rand(1..1000)
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include?(item)
  end
end
