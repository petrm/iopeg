require 'rubygems'
require 'treetop'
require 'eng'

p EngParser.new.parse( "Hello there, fine World!" )

__END__
SyntaxNode+Sentence2 offset=0, "...o there, fine World!" (capitalized_word,terminal_punctuation):
  SyntaxNode+CapitalizedWord0 offset=0, "Hello":
    SyntaxNode offset=0, "H"
    SyntaxNode offset=1, "ello":
      SyntaxNode offset=1, "e"
      SyntaxNode offset=2, "l"
      SyntaxNode offset=3, "l"
      SyntaxNode offset=4, "o"
  SyntaxNode offset=5, " there, fine World":
    SyntaxNode+Sentence0 offset=5, " there," (word,inline_punctuation,space):
      SyntaxNode offset=5, " "
      SyntaxNode offset=6, "there":
        SyntaxNode offset=6, "t"
        SyntaxNode offset=7, "h"
        SyntaxNode offset=8, "e"
        SyntaxNode offset=9, "r"
        SyntaxNode offset=10, "e"
      SyntaxNode offset=11, ","
    SyntaxNode+Sentence1 offset=12, " fine" (word,space):
      SyntaxNode offset=12, " "
      SyntaxNode offset=13, "fine":
        SyntaxNode offset=13, "f"
        SyntaxNode offset=14, "i"
        SyntaxNode offset=15, "n"
        SyntaxNode offset=16, "e"
    SyntaxNode+Sentence1 offset=17, " World" (word,space):
      SyntaxNode offset=17, " "
      SyntaxNode offset=18, "World":
        SyntaxNode offset=18, "W"
        SyntaxNode offset=19, "o"
        SyntaxNode offset=20, "r"
        SyntaxNode offset=21, "l"
        SyntaxNode offset=22, "d"
  SyntaxNode offset=23, "!"
