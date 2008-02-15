PEGParser

TestPEGParser := UnitTest clone do(  
  test1_parsing := method(
    assertParses( File with( "PEG.peg" ) contents )
  )
  
  assertParses := method( str,
    assertNotNil( PEGParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( PEGParser parse( str ) )
  )
)
TestPEGParser run
