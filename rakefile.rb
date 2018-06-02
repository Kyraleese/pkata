require_relative "wordsearch.rb"

desc "Install bundler and then the gems for this kata"
task :install do
  exec("gem install bundler")
  exec("bundle install")
end

desc "Run test framework"
task :test do
  exec("rspec")
end

desc "Check your wordsearch solution"
task :check_grid, [:file] do |task, args|
  ws = Wordsearch.new(args[:file])
  puts "Puzzle:"
  puts ws.wordbank.join(',')
  ws.grid.each do |x| puts x.join(',') end
  puts "\nSolution:"
  puts ws.search
end
