require_relative 'item'

class MusicAlbum < item
  attr_reader :on_spotify, :archived

  def initialize(on_spotify: false, archived: false)
    super(archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    @archived && @on_spotify
  end
end