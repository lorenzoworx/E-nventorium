require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, publish_date, archived, publisher, cover_state)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end

book1 = Book.new(223, '2020-01-01', true, 'Pub name', 'bad')
p book1.archived
