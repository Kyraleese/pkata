class Wordsearch
  attr_accessor :wordbank, :grid, :search_results, :search_methods

  def initialize(filename)
    input_file = File.open(filename, 'r')
    @wordbank = input_file.gets.strip.split(',')

    @grid = []
    input_file.each do |grid_line|
      @grid << grid_line.strip.split(',')
    end

    @search_results = []

    @search_methods = [
      SearchMethods::Horizontal.new(@grid.clone), 
      SearchMethods::Vertical.new(@grid.clone), 
      SearchMethods::DiagonalDown.new(@grid.clone),
      SearchMethods::DiagonalUp.new(@grid.clone)
    ]
  end

  def search
    @wordbank.each do |word|
      search_result = ''
      @search_methods.each do |method|
        #look forward
        row, col = method.coordinates_of_word(word)
        word_loc = method.full_location_of_word(row, col, word)
        search_result = method.search_result(word, word_loc)
        break unless search_result.include?('(,)')
        #look backward
        row, col = method.coordinates_of_word(word.reverse)
        word_loc = method.full_location_of_word(row, col, word.reverse).reverse
        search_result = method.search_result(word, word_loc)
        break unless search_result.include?('(,)')
      end
      @search_results << search_result
    end

    @search_results
  end

end
