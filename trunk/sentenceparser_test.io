SentenceParser

SentenceTester := UnitTest clone do(  
  test1_parsing := method(
    assertParses( "Hello World!" )
    assertParses( "Hello!" )
    assertParses( "Hello there you sexy world!" )
    assertParses( "Hello there, world!" )
    assertParseFailure( "" )
    assertParseFailure( "!" )
    assertParseFailure( "hello world!" )
    assertParseFailure( "Hello World! BORK" )   # not ending with punc, bad.
  )
  
  xtest2_tree := method(
    tree := SentenceParser parse( "Hello world!" )
    assertEquals( tree text, "Hello world!" )
  )
  
  assertParses := method( str,
    assertNotNil( SentenceParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( SentenceParser parse( str ) )
  )
)
SentenceTester run

SentenceParser parse( "Hello there, fine World!" ) showTree
#=> <SyntaxNode_0x32e2f0 'Hello there, fine World!' 3 children>
#=>   <SyntaxNode_0x2f0040 'Hello' 2 children>
#=>     <SyntaxNode_0x391390 'H' 0 children>
#=>     <SyntaxNode_0x2a6bf0 'ello' 0 children>
#=>   <SyntaxNode_0x2bbdf0 ' there, fine World' 3 children>
#=>     <SyntaxNode_0x251d10 ' there,' 3 children>
#=>       <SyntaxNode_0x38df70 ' ' 0 children>
#=>       <SyntaxNode_0x3294c0 'there' 0 children>
#=>       <SyntaxNode_0x2f9ad0 ',' 0 children>
#=>     <SyntaxNode_0x20baf0 ' fine' 2 children>
#=>       <SyntaxNode_0x2c5b20 ' ' 0 children>
#=>       <SyntaxNode_0x25e570 'fine' 0 children>
#=>     <SyntaxNode_0x25f250 ' World' 2 children>
#=>       <SyntaxNode_0x2a6720 ' ' 0 children>
#=>       <SyntaxNode_0x251210 'World' 0 children>
#=>   <SyntaxNode_0x2c8d70 '!' 0 children>

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
