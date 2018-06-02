require_relative "base.rb"

module SearchMethods
  class DiagonalUp < Base
    attr_accessor :original_grid_length

    def initialize(grid)
      @grid = grid

      @original_grid_length = @grid.length

      @grid.each_with_index do |row, i|
        @grid[i] = Array.new(i, ' ') + @grid[i] + Array.new((@original_grid_length - i), ' ')
      end

      @grid = @grid.reverse.transpose
    end

    def full_location_of_word(row, col, word)
        return [[row, col]] if row.nil? || col.nil?

        original_row = @original_grid_length - (col + 1)
        original_col = row - original_row

        locs = []
        
        word.length.times do |i|
          locs << [(original_row - i) , (original_col + i)]
        end

        locs

    end
  end
end
