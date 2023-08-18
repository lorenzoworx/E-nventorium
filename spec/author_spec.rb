require_relative '../classes/author'
require_relative '../classes/game'
describe Author do
  let(:author) { Author.new('wolter', 'ben') }
  let(:game) { Game.new('2023-01-01', 'Title', true, '2023-02-01') }

  it 'has a generated ID, firstname, and lastname' do
    expect(author.id).to be_a(Integer)
    expect(author.firstname).to eq('wolter')
    expect(author.lastname).to eq('ben')
  end

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
