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
        ['W','P','L','M','M','I','W','A','M','X','D','A','S','B','L'],
        ['Y','I','P','Q','G','K','I','K','C','Q','G','A','Z','M','G'],
        ['N','Q','A','E','U','A','B','N','A','O','O','K','N','U','V'],
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
    describe "#index_of_word" do
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

    describe "#location_of_word" do
      it "returns the indices of a word" do
        row = 9
        col = 0
        word = subject.wordbank[8]

        expect(subject.location_of_word(row, col, word)).to eq("(9,0), (9,1), (9,2), (9,3), (9,4), (9,5), (9,6), (9,7), (9,8), (9,9)")

      end
    end

    describe "#vertical_location_of_word" do
      it "returns the indices of a word" do
        row = 4
        col = 5
        word = subject.wordbank[9]

        expect(subject.vertical_location_of_word(row, col, word)).to eq("(4,5), (5,5), (6,5), (7,5)")
      end
    end
  end

  context "horizontal search" do
    context "-> left to right" do
      it "returns location of TASSLEHOFF" do
        expect(subject.search("TASSLEHOFF")).to eq("TASSLEHOFF: (9,0), (9,1), (9,2), (9,3), (9,4), (9,5), (9,6), (9,7), (9,8), (9,9)")
      end
    end
  end

  context "vertical search" do
    context "-> top to bottom" do
      xit "returns location of TIKA" do
        expect(subject.vertical_search("TIKA")).to eq("TIKA: (4,5), (5,5), (6,5), (7,5)")
      end
    end
  end
end
