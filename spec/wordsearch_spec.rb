require_relative "../wordsearch.rb"

describe Wordsearch do

  context "initialization" do
    it "should load the word bank from the file" do
      wordsearch = Wordsearch.new("spec/data/test.txt")
      expect(wordsearch.wordbank).to eq(['CARAMON','FLINT','GOLDMOON','LAURANA','RAISTLIN','RIVERWIND','STURM','TANIS','TASSLEHOFF','TIKA'])
    end

    it "should load the word grid from the file" do
      wordsearch = Wordsearch.new("spec/data/test.txt")
      expect(wordsearch.grid).to eq([
        ['R','W','N','H','A','N','A','R','U','A','L','M','S','E','Q'],
        ['E','I','L','O','W','Y','A','E','X','K','A','R','I','M','U'],
        ['R','B','V','N','M','I','J','C','P','T','H','U','X','X','Z'],
        ['K','M','O','E','S','A','T','A','N','I','S','T','A','M','Q'],
        ['A','A','P','T','R','T','R','J','F','Q','V','S','H','K','J'],
        ['W','P','L','M','M','W','I','A','M','X','D','A','S','B','L'],
        ['Y','I','P','Q','G','D','I','K','C','Q','G','A','Z','M','G'],
        ['N','Q','A','E','U','J','B','N','A','O','O','K','N','U','V'],
        ['L','U','W','I','E','J','D','T','D','J','L','P','D','Y','P'],
        ['T','A','S','S','L','E','H','O','F','F','D','U','Q','U','I'],
        ['Z','T','F','V','P','D','S','P','P','I','M','Y','V','K','T'],
        ['N','P','M','A','N','O','X','Z','Y','H','O','T','H','N','R'],
        ['O','A','U','N','C','H','L','H','Z','M','O','M','I','T','Z'],
        ['L','Y','K','B','H','M','Z','K','O','F','N','L','J','M','U'],
        ['H','Z','M','N','D','A','A','B','G','J','F','V','E','L','K']
      ])
    end
  end

  context "detect word" do
    it "finds the starting index of word in a list" do
      wordsearch = Wordsearch.new("spec/data/test.txt")
      list = wordsearch.grid[9]
      word = wordsearch.wordbank[8]
  
      expect(wordsearch.index_of_word(list, word)).to eq(0) 
    end
  end
end
