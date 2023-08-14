require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date

  def initialize(id, publish_date)
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

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end
  
  def label=(label)
    @label = label
  end
end
