require_relative '../classes/game'

RSpec.describe Game do
  let(:current_date) { Date.new(2023, 8, 18) }

  describe '#can_be_archived?' do
    context 'when the game is archived and last played date is older than two years' do
      it 'returns true' do
        game = Game.new('football Game', '2021-01-01', true, true, '2020-01-01')

        allow(Date).to receive(:today).and_return(current_date)

        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the game is archived but last played date is not older than two years' do
      it 'returns false' do
        game = Game.new('fooball Game', '2021-01-01', true, true, '2022-01-01')

        allow(Date).to receive(:today).and_return(current_date)

        expect(game.can_be_archived?).to be false
      end
    end

    context 'when the game is not archived' do
      it 'returns false' do
        game = Game.new('football Game', '2021-01-01', false, true, '2020-01-01')

        allow(Date).to receive(:today).and_return(current_date)

        expect(game.can_be_archived?).to be false
      end
    end
  end
end
