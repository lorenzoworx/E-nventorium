require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
  let(:author) { Author.new('Wolter', 'Kambale') }
  let(:game) { Game.new('Title', '2023-01-01', false, 2, '2023-02-01') }

  it 'adds an item to the author\'s items list' do
    author.add_item(game)
    expect(author.items).to include(game)
    expect(game.author).to eq(author)
  end

  it 'does not add the same item again' do
    author.add_item(game)
    author.add_item(game)
    expect(author.items.count).to eq(1)
  end
end
