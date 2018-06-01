require_relative "base.rb"

module SearchMethods
  class Vertical < Base

    def initialize(grid)
      @grid = grid.transpose
    end


    def full_location_of_word(row, col, target_word)
      return [[row, col]] if row.nil? || col.nil?
      (col..(col + target_word.length - 1)).map{|c| [c, row] }
    end

  end
end
