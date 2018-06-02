# pkata -- Ruby
# Your mileage may vary if running this on windows.  Instructions generated for a *nix system (so you should already have ruby installed)
# Note: While there's an implied trust here, this *is* a public repo.  Good practice is to always make sure that the commands you run do what you expect before you run them.  Since this is pretty small and it's easy to validate, I didn't generate a checksum; I've listed what the commands will do so that you can quickly validate.  I take no responsibility for any ill effects that occur should you not check before you run.

Step 1:
  Clone this repository to your system
  
Step 2:
  From your local copy of the repository, run the following command: 'gem install rake' 
  (not strictly necessary to run from the repo, but you're going to be running other things here in further steps, so might as well do it here)
  Note: If you already have rake installed, you should be able to skip this step
  
Step 3:
  run 'rake install'
  Note: This will gem install bundler and then bundle install the bundle (which just has rspec)
  
Step 4:
  run 'rake test'
  Note: This will run the test suite located in /spec



Optional Step 5:
  If you would like to test other wordsearches against this solver, follow the following steps:

  Step 1: Generate a wordsearch specification file that looks something like:

    BONES,KHAN,KIRK,SCOTTY,SPOCK,SULU,UHURA
    U,M,K,H,U,L,K,I,N,V,J,O,C,W,E
    L,L,S,H,K,Z,Z,W,Z,C,G,J,U,Y,G
    H,S,U,P,J,P,R,J,D,H,S,B,X,T,G
    B,R,J,S,O,E,Q,E,T,I,K,K,G,L,E
    A,Y,O,A,G,C,I,R,D,Q,H,R,T,C,D
    S,C,O,T,T,Y,K,Z,R,E,P,P,X,P,F
    B,L,Q,S,L,N,E,E,E,V,U,L,F,M,Z
    O,K,R,I,K,A,M,M,R,M,F,B,A,P,P
    N,U,I,I,Y,H,Q,M,E,M,Q,R,Y,F,S
    E,Y,Z,Y,G,K,Q,J,P,C,Q,W,Y,A,K
    S,J,F,Z,M,Q,I,B,D,B,E,M,K,W,D
    T,G,L,B,H,C,B,E,C,H,T,O,Y,I,K
    O,J,Y,E,U,L,N,C,C,L,Y,B,Z,U,H
    W,Z,M,I,S,U,K,U,R,B,I,D,U,X,S
    K,Y,L,B,Q,Q,P,M,D,F,C,K,E,A,B
    
  The generator used for this task was found at http://puzzlemaker.discoveryeducation.com/WordSearchSetupForm.asp?campaign=flyout_teachers_puzzle_wordcross
  
  Anything that creates a file of the format shown above should work.

  Step 2: Save the puzzle wherever you'd like.  I've created a /puzzles directory to serve as a home for these, but they can go anywhere, really.
  
  Step 3: run rake check_grid["/path/to/puzzle/foo.txt"]
    Note: To see an example, I've added the puzzle above to /puzzles, and you can test it running "rake check_grid["puzzles/pkata.txt"]"
