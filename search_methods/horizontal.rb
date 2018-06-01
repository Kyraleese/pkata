module SearchMethods
  class Horizontal
    attr_accessor :grid

    def initialize(grid)
      @grid = grid
    end

    def index_of_word(list, word)
      list.join('').index(word)
    end

    def coordinates_of_word(grid, target_word)
      coords = [] 
      grid.each_with_index do |row, i|
        x = index_of_word(row, target_word)
        next unless !!x

        coords = [i, x]
      end

      coords
    end


  end
end
