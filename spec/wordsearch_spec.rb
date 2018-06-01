require_relative "../wordsearch.rb"

describe Wordsearch do

  context "initialization" do
    it "should load the word bank from the file" do
      wordsearch = Wordsearch.new("spec/data/test.txt")
      expect(wordsearch.wordbank).to eq(['CARAMON','FLINT','GOLDMOON','LAURANA','RAISTLIN','RIVERWIND','STURM','TANIS','TASSLEHOFF','TIKA'])
    end
  end
end
