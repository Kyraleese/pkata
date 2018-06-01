require_relative "base.rb"

module SearchMethods
  class Horizontal < Base

    def full_location_of_word(row, col, target_word)
      (col..(col + target_word.length - 1)).map{|c| [row, c] }
    end

    def search_result(word, word_location)
      locs = word_location.map{|loc| "(#{loc[0]},#{loc[1]})"}.join(', ')
      "#{word}: #{locs}"
    end
  end
end
