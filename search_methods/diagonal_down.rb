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
      col = col - @original_grid_length + row

      locs = []

      word.length.times do |i|
        locs << [(row + i) , (col + i)]
      end

      locs
    end
  end
end
