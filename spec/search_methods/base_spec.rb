require_relative "../../search_methods/base.rb"

describe SearchMethods::Base do
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

  let(:subject) { SearchMethods::Base.new(wordgrid) }

  context "initialization" do
    it "should load the word grid in the right format" do
      expect(subject.grid).to eq(wordgrid)
    end
  end

  context "detect word" do
    describe "#index_of_word" do
      it "returns nil when it can't find the word in the list" do
        list = subject.grid[9]
        word = "FOO"

        expect(subject.index_of_word(list, word)).to eq(nil)
      end
    end

    describe "#coordinates_of_word" do
      it "returns nil, nil coordinates when words is not found" do
        expect(subject.coordinates_of_word("FOO")).to eq([nil, nil])
      end
    end

    describe "#full_location_of_word" do
      it "returns [nil, nil] when no coords are passsed" do
        row = nil
        col = nil
        word = "FOO"

        expect(subject.full_location_of_word(row, col, word)).to eq([[nil, nil]])
      end
    end
  end
end
