require_relative '../classes/game'

describe Game do
  let(:current_date) { Date.parse('2023-08-18') }

  before do
    allow(Date).to receive(:today).and_return(current_date)
  end

  describe '#can_be_archived?' do
    context 'when the game is archived and last played date is older than two years' do
      it 'returns true' do
        game = Game.new('2023-01-01', 'Football Game', false, '2019-01-01')
        expect(game.can_be_archived?).to be(false)
      end
    end

    context 'when the game is archived but last played date is not older than two years' do
      it 'returns false' do
        game = Game.new('2020-01-01', 'Football Game', true, '2022-01-01')
        expect(game.can_be_archived?).to be(false)
      end
    end

    context 'when the game is not archived' do
      it 'returns false' do
        game = Game.new('2020-01-01', 'Football Game', false, '2019-01-01')
        expect(game.can_be_archived?).to be(false)
      end
    end
  end
end
