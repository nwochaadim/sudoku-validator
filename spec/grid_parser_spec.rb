describe GridParser do

  describe '#parse_for_rows' do
    it 'returns the right grid of integers' do
      payload = File.read('spec/fixtures/valid_complete.sudoku')
      parser = GridParser.new(payload)

      result = parser.parse_for_rows

      expect(result).to eq(
        [
          [8, 5, 9, 6, 1, 2, 4, 3, 7],
          [7, 2, 3, 8, 5, 4, 1, 6, 9],
          [1, 6, 4, 3, 7, 9, 5, 2, 8],
          [9, 8, 6, 1, 4, 7, 3, 5, 2],
          [3, 7, 5, 2, 6, 8, 9, 1, 4],
          [2, 4, 1, 5, 9, 3, 7, 8, 6],
          [4, 3, 2, 9, 8, 1, 6, 7, 5],
          [6, 1, 7, 4, 2, 5, 8, 9, 3],
          [5, 9, 8, 7, 3, 6, 2, 4, 1]
        ]
      )
    end
  end

  describe '#parse_with_columns' do
    it 'returns all columns' do
      payload = File.read('spec/fixtures/valid_complete.sudoku')
      parser = GridParser.new(payload)

      result = parser.parse_for_columns

      expect(result).to eq(
        [
          [8, 7, 1, 9, 3, 2, 4, 6, 5],
          [5, 2, 6, 8, 7, 4, 3, 1, 9],
          [9, 3, 4, 6, 5, 1, 2, 7, 8],
          [6, 8, 3, 1, 2, 5, 9, 4, 7],
          [1, 5, 7, 4, 6, 9, 8, 2, 3],
          [2, 4, 9, 7, 8, 3, 1, 5, 6],
          [4, 1, 5, 3, 9, 7, 6, 8, 2],
          [3, 6, 2, 5, 1, 8, 7, 9, 4],
          [7, 9, 8, 2, 4, 6, 5, 3, 1]
        ]
      )
    end
  end

  describe '#parse_for_grids' do
    it 'returns all grids' do
      payload = File.read('spec/fixtures/valid_complete.sudoku')
      parser = GridParser.new(payload)

      result = parser.parse_for_subgrids

      expect(result).to eq(
        [
          [8, 5, 9, 7, 2, 3, 1, 6, 4],
          [6, 1, 2, 8, 5, 4, 3, 7, 9],
          [4, 3, 7, 1, 6, 9, 5, 2, 8],
          [9, 8, 6, 3, 7, 5, 2, 4, 1],
          [1, 4, 7, 2, 6, 8, 5, 9, 3],
          [3, 5, 2, 9, 1, 4, 7, 8, 6],
          [4, 3, 2, 6, 1, 7, 5, 9, 8],
          [9, 8, 1, 4, 2, 5, 7, 3, 6],
          [6, 7, 5, 8, 9, 3, 2, 4, 1]
        ]
      )
    end
  end
end
