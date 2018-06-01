require_relative "../../search_methods/vertical.rb"

describe SearchMethods::Vertical do
  let(:wordgrid) {
    [
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
    ]
  }

  let(:subject) { SearchMethods::Vertical.new(wordgrid) }

  context "initialization" do
    it "should load the word grid in the right format" do
      expect(subject.grid).to eq(wordgrid.transpose)
    end
  end

  context "detect word" do
    describe "#index_of_word" do
      it "finds the starting index of word in a list" do
        list = subject.grid[5]
        word = 'TIKA'
    
        expect(subject.index_of_word(list, word)).to eq(4) 
      end

      it "returns nil when it can't find the word in the list" do
        list = subject.grid[5]
        word = "FOO"

        expect(subject.index_of_word(list, word)).to eq(nil)
      end

    end

    describe "#coordinates_of_word" do
      it "returns the x,y coordinates of the word in grid" do
        expect(subject.coordinates_of_word(subject.grid, "TIKA")).to eq([5,4])
      end
    end

    describe "#full_location_of_word" do
      it "returns the indices of a word" do
        row = 5
        col = 4
        word = 'TIKA'

        expect(subject.full_location_of_word(row, col, word)).to eq([[5,4], [5,5], [5,6], [5,7]])

      end
    end
  end

  context "search for word" do
    describe "#search_result" do
      it "returns proper output string" do
        word = 'TIKA'
        word_location = [[5,4], [5,5], [5,6], [5,7]]

        expect(subject.search_result(word, word_location)).to eq("TIKA: (4,5), (5,5), (6,5), (7,5)")
      end
    end
  end

end
