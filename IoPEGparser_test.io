IoPEGParser

TestPEGParser := UnitTest clone do(  
  test1_parsing := method(
    assertParses( File with( "IoPEG.peg" ) contents )
    assertParses( File with( "eng.peg" ) contents )
  )
  
  assertParses := method( str,
    assertNotNil( IoPEGParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( IoPEGParser parse( str ) )
  )
)
TestPEGParser run
# IoPEGParser parse( File with( "eng.peg" ) contents ) showTree
# IoPEGParser parse( File with( "IoPEG.peg" ) contents ) showTree
