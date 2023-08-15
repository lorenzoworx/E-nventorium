require 'date'

class Game
  attr_reader :multiplayers, :lastplayed_date

  def initialize(multiplayers, lastplayed_date)
    @multiplayers = multiplayers
    @lastplayed_date = lastplayed_date
    @archived = false
  end

  def can_be_archived?
    last_played_older_than_two_years?
  end

  def move_to_archive
    @archived = true
  end

  private

  def last_played_older_than_two_years?
    current_date = Date.today
    last_played_date = Date.parse(@lastplayed_date)
    years_difference = (current_date.year - last_played_date.year)

    years_difference >= 2
  end
end
