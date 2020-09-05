class GridParser

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def parse_for_rows
    @parse_for_rows ||=
      puzzle_string.
        split(/\n/).
        reject { |row| row =~ /--/ }.
        map { |row| row.delete('|').split(' ').map(&:to_i) }
  end

  def parse_for_columns
    parse_for_rows.transpose
  end

  def parse_for_subgrids
    rows = parse_for_rows
    find_grids(rows)
  end

  private

  attr_reader :puzzle_string

  def find_grids(rows)
    grids = []
    i = 0

    while i < 3 do
      j = 0
      while j < 3 do
        grids << find_subgrid(i, j, rows)
        j += 1
      end
      i += 1
    end
    grids
  end

  def find_subgrid(i, j, rows)
    x = 0
    grid = []
    while x < 3 do
      y = 0
      while y < 3 do
        col_index = j * 3 + y
        row_index = i * 3 + x
        grid << rows[row_index][col_index]
        y += 1
      end
      x += 1
    end
    grid
  end

end
