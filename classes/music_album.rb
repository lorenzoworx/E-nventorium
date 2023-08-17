require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify, :archived

  def initialize(publish_date:, on_spotify: false, archived: false)
    super(archived: archived, publish_date: publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    @archived && @on_spotify
  end
end
