require_relative '../../search_methods/diagonal_up.rb'

describe SearchMethods::DiagonalUp do
  let(:wordgrid) {
    [
      ['R','W','N','H','A','N','A','R','U','A','L','M','S','E','T'],
      ['E','I','L','O','W','Y','A','E','X','K','A','R','I','M','I'],
      ['R','B','V','N','M','I','J','C','P','T','H','U','X','X','K'],
      ['K','M','O','E','S','A','T','A','N','I','S','T','A','M','A'],
      ['A','A','P','T','R','T','R','J','F','Q','V','S','H','K','J'],
      ['W','P','L','M','M','W','W','A','M','X','D','A','S','B','L'],
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

  let(:wordgrid_modified) {
    [
      ['R','W','N','H','A','N','A','R','U','A','L','M','S','E','T',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ','E','I','L','O','W','Y','A','E','X','K','A','R','I','M','I',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ','R','B','V','N','M','I','J','C','P','T','H','U','X','X','K',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ','K','M','O','E','S','A','T','A','N','I','S','T','A','M','A',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ','A','A','P','T','R','T','R','J','F','Q','V','S','H','K','J',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ','W','P','L','M','M','W','W','A','M','X','D','A','S','B','L',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ','Y','I','P','Q','G','K','I','K','C','Q','G','A','Z','M','G',' ',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ','N','Q','A','E','U','A','B','N','A','O','O','K','N','U','V',' ',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ','L','U','W','I','E','J','D','T','D','J','L','P','D','Y','P',' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ','T','A','S','S','L','E','H','O','F','F','D','U','Q','U','I',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','Z','T','F','V','P','D','S','P','P','I','M','Y','V','K','T',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','N','P','M','A','N','O','X','Z','Y','H','O','T','H','N','R',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','O','A','U','N','C','H','L','H','Z','M','O','M','I','T','Z',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','L','Y','K','B','H','M','Z','K','O','F','N','L','J','M','U',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','H','Z','M','N','D','A','A','B','G','J','F','V','E','L','K',' '],
    ]
  }

  let(:subject) { SearchMethods::DiagonalUp.new(wordgrid) }

  context "initialization" do
    it "should load the word grid in the right format" do
      expect(subject.grid).to eq(wordgrid_modified.reverse.transpose)
    end
  end

  context "detect word" do
    describe "#index_of_word" do
      it "finds the starting index of word in a list" do
        list = subject.grid[24]
        word = 'FLINT'
    
        expect(subject.index_of_word(list, word)).to eq(0) 
      end
    end

    describe "#coordinates_of_word" do
      it "returns the x,y coordinates of the word in grid" do
        expect(subject.coordinates_of_word("FLINT")).to eq([24,0])
      end
    end


  end

end
