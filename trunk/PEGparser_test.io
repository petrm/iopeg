PEGParser

TestPEGParser := UnitTest clone do(  
  test1_parsing := method(
    assertParses(  )
    assertParses( "Hello!" )
    assertParses( "Hello there you sexy world!" )
    assertParses( "Hello there, world!" )
    assertParseFailure( "" )
    assertParseFailure( "!" )
    assertParseFailure( "hello world!" )
    assertParseFailure( "Hello World! BORK" )   # not ending with punc, bad.
  )
  
  assertParses := method( str,
    assertNotNil( PEGParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( PEGParser parse( str ) )
  )
)
TestPEGParser run

PEGParser parse( File with( "PEG.peg" ) contents ) showTree
