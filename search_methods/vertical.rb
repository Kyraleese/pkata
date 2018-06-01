require_relative "base.rb"

module SearchMethods
  class Vertical < Base

    def initialize(grid)
      @grid = grid.transpose
    end

    def full_location_of_word(row, col, target_word)
      (col..(col + target_word.length - 1)).map{|c| [row, c] }
    end

    # since we transposed the grid so we could more easily search, 
    # we want (y,x) results instead of (x,y) to make our row 
    # become a column in the original
    def search_result(word, word_location)
      locs = word_location.map{|loc| "(#{loc[1]},#{loc[0]})"}.join(', ')
      "#{word}: #{locs}"
    end

  end
end
