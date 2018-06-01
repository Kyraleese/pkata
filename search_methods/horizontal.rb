require_relative "base.rb"

module SearchMethods
  class Horizontal < Base

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

    def full_location_of_word(row, col, target_word)
      (col..(col + target_word.length - 1)).map{|c| [row, c] }
    end

    def search_result(word, word_location)
      locs = word_location.map{|loc| "(#{loc[0]},#{loc[1]})"}.join(', ')
      "#{word}: #{locs}"
    end
  end
end
