class RowValidator
  attr_reader :message

  def initialize(grid)
    @grid = grid
    @message = 'This sudoku is valid.'
    @incomplete = false
  end

  def valid?
    grid.all? { |row| row_valid?(row) }
  end

  def incomplete?
    @incomplete
  end

  private

  attr_reader :grid

  def row_valid?(row)
    num_occurences = Array.new(9, 0)
    row.each do |num|
      next if num.zero?
      num_occurences[num - 1] += 1
      return false if duplicates_exist?(num_occurences, num)
    end
    check_if_row_complete(num_occurences)
    true
  end

  def duplicates_exist?(num_occurences, num)
    if num_occurences[num - 1] > 1
      @message = 'This sudoku is invalid.'
      true
    end
  end

  def check_if_row_complete(num_occurences)
    return unless num_occurences.any?(&:zero?)
    @message = 'This sudoku is valid, but incomplete.'
    @incomplete = true
  end

end
