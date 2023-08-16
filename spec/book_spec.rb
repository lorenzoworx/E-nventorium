require_relative '../classes/item'
require_relative '../classes/book'

RSpec.describe Book do
  let(:publish_date) { '2010-01-01' }
  let(:archived) { false }
  let(:publisher) { 'Otmane Pub' }
  let(:cover_state) { 'Not bad' }

  subject(:book) { Book.new(publish_date, archived, publisher, cover_state) }

  describe 'initialize' do
    it 'assigns publisher and cover_state attributes' do
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe 'can_be_archived?' do
    context 'when cover state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when cover state is not bad' do
      let(:cover_state) { 'Not bad' }

      context 'and item can be archived' do
        before { allow(book).to receive(:super).and_return(true) }

        it 'returns true' do
          expect(book.send(:can_be_archived?)).to eq(true)
        end
      end

      context 'and item cannot be archived' do
        before { allow(book).to receive(:can_be_archived?).and_return(false) }

        it 'returns false' do
          expect(book.send(:can_be_archived?)).to eq(false)
        end
      end
    end
  end
end
