require_relative "../wordsearch.rb"

describe Wordsearch do

  let(:subject) { Wordsearch.new("spec/data/test.txt") }

  context "initialization" do
    it "should load the word bank from the file" do
      expect(subject.wordbank).to eq(['CARAMON','FLINT','GOLDMOON','LAURANA','RAISTLIN','RIVERWIND','STURM','TANIS','TASSLEHOFF','TIKA'])
    end

    it "should load the word grid from the file" do
      expect(subject.grid).to eq([
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
      list = subject.grid[9]
      word = subject.wordbank[8]
  
      expect(subject.index_of_word(list, word)).to eq(0) 
    end

    it "returns nil when it can't find the word in the list" do
      list = subject.grid[9]
      word = "FOO"

      expect(subject.index_of_word(list, word)).to eq(nil)
    end
  end
end
