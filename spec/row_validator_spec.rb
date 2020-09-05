describe RowValidator do

  describe '#valid?' do
    context 'when the row is valid' do
      it 'is valid' do
        row = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)

        expect(validator).to be_valid
      end
    end

    context 'when an invalid sudoku is processed' do
      it 'is invalid' do
        row = [1, 2, 3, 4, 5, 6, 6, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)

        expect(validator).to_not be_valid
      end
    end
  end

  describe '#message' do
    context 'when row has duplicates' do
      it 'returns an invalid message' do
        row = [1, 2, 3, 4, 5, 6, 6, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)
        validator.valid?

        result = validator.message

        expect(result).to eq('This sudoku is invalid.')
      end
    end

    context 'when row does not have duplicate but complete' do
      it 'returns an incomplete message' do
        row = [1, 2, 3, 4, 5, 0, 6, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)
        validator.valid?

        result = validator.message

        expect(result).to eq('This sudoku is valid, but incomplete.')
      end
    end

    context 'when row has no duplicates and is complete' do
      it 'is valid' do
        row = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)
        validator.valid?

        result = validator.message

        expect(result).to eq('This sudoku is valid.')
      end
    end
  end

  describe '#incomplete' do
    context 'when the sudoku is incomplete' do
      it 'is incomplete' do
        row = [1, 2, 3, 4, 5, 0, 6, 8, 9]
        grid = [row]
        validator = RowValidator.new(grid)
        validator.valid?

        expect(validator).to be_incomplete
      end
    end
  end

end
