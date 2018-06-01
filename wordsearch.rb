class Wordsearch
  attr_accessor :wordbank

  def initialize(filename)
    input_file = File.open(filename, 'r')
    @wordbank = input_file.gets.chomp.split(',')
  end
end
