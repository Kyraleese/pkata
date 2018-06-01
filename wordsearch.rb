class Wordsearch
  attr_accessor :wordbank, :horizontal_grid, :vertical_grid

  def initialize(filename)
    input_file = File.open(filename, 'r')
    @wordbank = input_file.gets.strip.split(',')

    @horizontal_grid = []
    input_file.each do |grid_line|
      @horizontal_grid << grid_line.strip.split(',')
    end

    @vertical_grid = @horizontal_grid.transpose()
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

  def horizontal_location_of_word(row, col, word)
    (0..(word.length - 1)).map{|c| "(#{row},#{c + col})"}.join(', ')
  end

  def vertical_location_of_word(row, col, word)
    (0..(word.length - 1)).map{|r| "(#{r + row},#{col})"}.join(', ')
  end

  def horizontal_search(target_word)
    x, y = coordinates_of_word(@horizontal_grid, target_word)

    "#{target_word}: #{horizontal_location_of_word(x, y, target_word)}"
  end

  def vertical_search(target_word)
    x, y = coordinates_of_word(@vertical_grid, target_word)

    "#{target_word}: #{vertical_location_of_word(y, x, target_word)}"
  end

end
