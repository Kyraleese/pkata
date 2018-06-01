require_relative "search_methods/horizontal.rb"

class Wordsearch
  attr_accessor :wordbank, :grid, :search_results

  def initialize(filename)
    input_file = File.open(filename, 'r')
    @wordbank = input_file.gets.strip.split(',')

    @grid = []
    input_file.each do |grid_line|
      @grid << grid_line.strip.split(',')
    end

    @search_results = []
  end

  def search
    horizontal_searcher = SearchMethods::Horizontal.new(@grid)
    vertical_searcher   = SearchMethods::Vertical.new(@grid)

    @wordbank.each do |word|
      row, col = horizontal_searcher.coordinates_of_word(word)

      if row.nil? && col.nil?
        row, col = vertical_searcher.coordinates_of_word(word)
        word_loc = vertical_searcher.full_location_of_word(row, col, word)
        @search_results << vertical_searcher.search_result(word, word_loc)
      else
        word_loc = horizontal_searcher.full_location_of_word(row, col, word)
        @search_results << horizontal_searcher.search_result(word, word_loc)
      end
    end
  end

end
