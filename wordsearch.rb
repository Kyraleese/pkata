class Wordsearch
  attr_accessor :wordbank, :grid

  def initialize(filename)
    input_file = File.open(filename, 'r')
    @wordbank = input_file.gets.strip.split(',')

    @grid = []
    input_file.each do |grid_line|
      @grid << grid_line.strip.split(',')
    end
  end

  def index_of_word(list, word)
    list.join('').index(word)
  end

  def location_of_word(row, col, word)
    (col..(word.length - 1)).map{|c| "(#{row},#{c})"}.join(', ')
  end

end
