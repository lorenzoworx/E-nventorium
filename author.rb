class Author
  attr_reader :id, :firstname, :lastname
  attr_accessor :items

  def initialize(_id, firstname, lastname)
    @id = rand(1..1000)
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
