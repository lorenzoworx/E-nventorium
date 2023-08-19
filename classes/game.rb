require_relative 'item'
require_relative 'author'
class Game < Item
  attr_accessor :title, :multiplayers, :lastplayed_date

  def initialize(publish_date, title, multiplayers, lastplayed_date)
    super(publish_date)
    @title = title
    @multiplayers = multiplayers
    @lastplayed_date = lastplayed_date
  end

  def can_be_archived?
    super && last_played_older_than_two_years?
  end

  private

  def last_played_older_than_two_years?
    current_date = Date.today
    last_played_date = Date.parse(@lastplayed_date)
    years_difference = current_date.year - last_played_date.year

    years_difference >= 2
  end
end
