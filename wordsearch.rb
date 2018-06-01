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

    @wordbank.each do |word|
      row, col = horizontal_searcher.coordinates_of_word(word)
      puts "R: #{row.to_i}, C: #{col.to_i}"
      word_loc = horizontal_searcher.full_location_of_word(row.to_i, col.to_i, word)
      @search_results << horizontal_searcher.search_result(word, word_loc)
    end
  end

end
