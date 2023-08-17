require_relative 'item'

class Game < Item
  attr_accessor :title, :multiplayers, :lastplayed_date, :archived, :author

  def initialize(title, publish_date, archived, multiplayers, lastplayed_date)
    super(nil, publish_date, archived)
    @title = title
    @multiplayers = multiplayers
    @lastplayed_date = lastplayed_date
    @author = nil
  end

  private

  def can_be_archived?
    super && last_played_older_than_two_years?
  end

  def last_played_older_than_two_years?
    current_date = Date.today
    last_played_date = Date.parse(@lastplayed_date)
    years_difference = (current_date.year - last_played_date.year)

    years_difference >= 2
  end
end
