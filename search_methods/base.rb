module SearchMethods
  class Base
    attr_accessor :grid

    def initialize(grid)
      @grid = grid
    end

    def index_of_word(list, word)
      list.join('').index(word)
    end

    def coordinates_of_word(target_word)
      coords = [nil, nil] 
      @grid.each_with_index do |row, i|
        x = index_of_word(row, target_word)
        next unless !!x

        coords = [i, x]
      end

      coords
    end

    def full_location_of_word(row, col, target_word)
      return [[row, col]] if row.nil? || col.nil?
      (col..(col + target_word.length - 1)).map{|c| [row, c] }
    end

  end
end
