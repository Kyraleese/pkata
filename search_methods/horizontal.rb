require_relative "base.rb"

module SearchMethods
  class Horizontal < Base
    def search_result(word, word_location)
      locs = word_location.map{|loc| "(#{loc[0]},#{loc[1]})"}.join(', ')
      "#{word}: #{locs}"
    end
  end
end
