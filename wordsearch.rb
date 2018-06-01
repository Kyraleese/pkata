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
    (0..(word.length - 1)).map{|c| "(#{row},#{c + col})"}.join(', ')
  end

  def vertical_location_of_word(row, col, word)
    (0..(word.length - 1)).map{|r| "(#{r + row},#{col})"}.join(', ')
  end

  def horizontal_search(target_word)
    search_result = ""
    @grid.each_with_index do |row, i|
      idx = index_of_word(row, target_word)
      next unless !!idx

      search_result = "#{target_word}: #{location_of_word(i, idx, target_word)}"
      break
    end

    search_result
  end

  def vertical_search(target_word)
    search_result = ""
    @grid.transpose.each_with_index do |col, i|
      idx = index_of_word(col, target_word)
      next unless !!idx

      search_result = "#{target_word}: #{vertical_location_of_word(idx, i, target_word)}"
      break
    end

    search_result
  end

end
