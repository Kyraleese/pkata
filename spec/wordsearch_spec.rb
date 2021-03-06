require_relative "../wordsearch.rb"

describe Wordsearch do

  let(:subject) { Wordsearch.new("spec/data/test.txt") }

  context "initialization" do
    it "should load the word bank from the file" do
      expect(subject.wordbank).to eq(['CARAMON','FLINT','GOLDMOON','LAURANA','RAISTLIN','RIVERWIND','STURM','TANIS','TASSLEHOFF','TIKA'])
    end

    it "should load the word grid from the file" do
      expect(subject.grid).to eq([
      ['R','W','N','H','A','N','A','R','U','A','L','M','S','E','A'],
      ['E','I','L','O','W','Y','A','E','X','K','A','R','I','M','K'],
      ['R','B','V','N','M','I','J','C','P','T','H','U','X','X','I'],
      ['K','M','O','E','S','A','T','A','N','I','S','T','A','M','T'],
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
      ])
    end
  end

  context "search" do
    describe "#solve" do
      it "finds all words" do
        search_results = [
          "CARAMON: (8,6), (7,5), (6,4), (5,3), (4,2), (3,1), (2,0)",
          "FLINT: (10,14), (11,13), (12,12), (13,11), (14,10)",
          "GOLDMOON: (10,6), (10,7), (10,8), (10,9), (10,10), (10,11), (10,12), (10,13)",
          "LAURANA: (10,0), (9,0), (8,0), (7,0), (6,0), (5,0), (4,0)",
          "RAISTLIN: (7,0), (6,1), (5,2), (4,3), (3,4), (2,5), (1,6), (0,7)",
          "RIVERWIND: (0,0), (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8)",
          "STURM: (11,4), (11,3), (11,2), (11,1), (11,0)",
          "TANIS: (6,3), (7,3), (8,3), (9,3), (10,3)",
          "TASSLEHOFF: (0,9), (1,9), (2,9), (3,9), (4,9), (5,9), (6,9), (7,9), (8,9), (9,9)",
          "TIKA: (14,3), (14,2), (14,1), (14,0)"
        ]
        subject.search
        expect(subject.search_results).to eq(search_results)
      end
    end

    it "finds all words in kata example" do
      subject = Wordsearch.new("spec/data/p_data.txt")

      search_results = [
        "BONES: (0,6), (0,7), (0,8), (0,9), (0,10)",
        "KHAN: (5,9), (5,8), (5,7), (5,6)",
        "KIRK: (4,7), (3,7), (2,7), (1,7)",
        "SCOTTY: (0,5), (1,5), (2,5), (3,5), (4,5), (5,5)",
        "SPOCK: (2,1), (3,2), (4,3), (5,4), (6,5)",
        "SULU: (3,3), (2,2), (1,1), (0,0)",
        "UHURA: (4,0), (3,1), (2,2), (1,3), (0,4)"
      ]
      subject.search
      expect(subject.search_results).to eq(search_results)
    end
  end

end
