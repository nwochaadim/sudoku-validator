require 'pry'
require_relative './grid_parser'
require_relative './row_validator'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    invalid = validators.reject(&:valid?).first
    incomplete = validators.select(&:incomplete?).first
    if invalid || incomplete
      (invalid || incomplete).message
    else
      'This sudoku is valid.'
    end
  end

  private

  attr_reader :puzzle_string

  def validators
    return @validators if @validators
    parser = GridParser.new(puzzle_string)
    validator1 = RowValidator.new(parser.parse_for_rows)
    validator2 = RowValidator.new(parser.parse_for_columns)
    validator3 = RowValidator.new(parser.parse_for_subgrids)
    @validators = [validator1, validator2, validator3]
  end
end

