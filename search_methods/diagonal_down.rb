require_relative "base.rb"

module SearchMethods
  class DiagonalDown < Base
    attr_accessor :original_grid_length

    def initialize(grid)
      @grid = grid

      @original_grid_length = @grid.length

      @grid.each_with_index do |row, i|
        @grid[i] = Array.new((@original_grid_length - i), ' ') + @grid[i] + Array.new(i, ' ')      
      end

      @grid = @grid.transpose
    end

    def full_location_of_word(row, col, word)
      return [[row, col]] if row.nil? || col.nil?

      new_row = col
      new_col = row

      f_row = new_row
      f_col = new_col - (@original_grid_length - col)

      locs = []

      word.length.times do |i|
        locs << [(f_row + i) , (f_col + i)]
      end

      locs
    end
  end
end
