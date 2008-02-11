SentenceParser

SentenceTester := UnitTest clone do(  
  test1_parsing := method(
    assertParses( "Hello World!" )
    assertParses( "Hello!" )
    assertParses( "Hello there you sexy world!" )
    assertParseFailure( "" )
    assertParseFailure( "!" )
    assertParseFailure( "hello world!" )
    assertParseFailure( "Hello there, world!" ) # inline punc not supported
    assertParseFailure( "Hello World! BORK" )   # not ending with punc, bad.
  )
  
  test2_tree := method(
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

SentenceParser parse( "Hello there fine World!" ) showTree
#=> <SyntaxNode_0x390340 'Hello there fine World!' 10 children>
#=>   <SyntaxNode_0x2fb120 'Hello' 2 children>
#=>     <SyntaxNode_0x3a2e80 'H' 0 children>
#=>     <SyntaxNode_0x3460a0 'ello' 0 children>
#=>   <SyntaxNode_0x2f3890 ' ' 0 children>
#=>   <SyntaxNode_0x32bf10 'there' 0 children>
#=>   <SyntaxNode_0x2dc110 ' ' 0 children>
#=>   <SyntaxNode_0x39a700 'fine' 0 children>
#=>   <SyntaxNode_0x22b350 ' ' 0 children>
#=>   <SyntaxNode_0x301c40 'World' 0 children>
#=>   <SyntaxNode_0x315860 '!' 0 children>
#
# Compared to Treetop:
#=> * 'Hello there fine world!'
#=>   * 'Hello'
#=>     * 'ello'
#=>       * 'e'
#=>       * 'l'
#=>       * 'l'
#=>       * 'o'
#=>   * ' there fine world'
#=>     * ' '
#=>     * 'there'
#=>       * 't'
#=>       * 'h'
#=>       * 'e'
#=>       * 'r'
#=>       * 'e'
#=>     * ' '
#=>     * 'fine'
#=>       * 'f'
#=>       * 'i'
#=>       * 'n'
#=>       * 'e'
#=>     * ' '
#=>     * 'world'
#=>       * 'w'
#=>       * 'o'
#=>       * 'r'
#=>       * 'l'
#=>       * 'd'
#=>   * '!'
