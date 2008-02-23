SentenceParser

SentenceTester := UnitTest clone do(  
  test1_parsing := method(
    assertParses( "Hello World!" )
    assertParses( "Hello!" )
    assertParses( "Hello there you sexy world!" )
    assertParses( "Hello there, world!" )
    assertParseFailure( "" )                    # no content
    assertParseFailure( "!" )                   # no first word
    assertParseFailure( "hello world!" )        # first word not capital
    assertParseFailure( "Hello World! BORK" )   # not ending with punc, bad.
  )
  
  xtest2_tree := method(
  )
  
  assertParses := method( str,
    assertNotNil( SentenceParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( SentenceParser parse( str ) )
  )
)
SentenceTester run

# SentenceParser parse( "Hello there, fine World!" ) showTree
#=> <Sentence keep 0..24 "Hello there, fine World!" 6 children>
#=>   <Word keep 0..5 "Hello" 0 children>
#=>   <Word keep 6..11 "there" 0 children>
#=>   <InlinePunctuation keep 11..12 "," 0 children>
#=>   <Word keep 13..17 "fine" 0 children>
#=>   <Word keep 18..23 "World" 0 children>
#=>   <TerminalPunctuation keep 23..24 "!" 0 children>

# Compared to Treetop:
#=> SyntaxNode+Sentence2 offset=0, "...o there, fine World!" (capitalized_word,terminal_punctuation):
#=>   SyntaxNode+CapitalizedWord0 offset=0, "Hello":
#=>     SyntaxNode offset=0, "H"
#=>     SyntaxNode offset=1, "ello":
#=>       SyntaxNode offset=1, "e"
#=>       SyntaxNode offset=2, "l"
#=>       SyntaxNode offset=3, "l"
#=>       SyntaxNode offset=4, "o"
#=>   SyntaxNode offset=5, " there, fine World":
#=>     SyntaxNode+Sentence0 offset=5, " there," (word,inline_punctuation,space):
#=>       SyntaxNode offset=5, " "
#=>       SyntaxNode offset=6, "there":
#=>         SyntaxNode offset=6, "t"
#=>         SyntaxNode offset=7, "h"
#=>         SyntaxNode offset=8, "e"
#=>         SyntaxNode offset=9, "r"
#=>         SyntaxNode offset=10, "e"
#=>       SyntaxNode offset=11, ","
#=>     SyntaxNode+Sentence1 offset=12, " fine" (word,space):
#=>       SyntaxNode offset=12, " "
#=>       SyntaxNode offset=13, "fine":
#=>         SyntaxNode offset=13, "f"
#=>         SyntaxNode offset=14, "i"
#=>         SyntaxNode offset=15, "n"
#=>         SyntaxNode offset=16, "e"
#=>     SyntaxNode+Sentence1 offset=17, " World" (word,space):
#=>       SyntaxNode offset=17, " "
#=>       SyntaxNode offset=18, "World":
#=>         SyntaxNode offset=18, "W"
#=>         SyntaxNode offset=19, "o"
#=>         SyntaxNode offset=20, "r"
#=>         SyntaxNode offset=21, "l"
#=>         SyntaxNode offset=22, "d"
#=>   SyntaxNode offset=23, "!"

