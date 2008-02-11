IoPEG

NodeTester := UnitTest clone do(  
  Node := IoPEG Parser SyntaxNode
  test_tree := method(
    h := Node leaf( "h", 0 )
    assertEquals( h text, "h" )
    assertEquals( h offset, 0 )
    
    i := Node leaf( "i", 1 )
    w1 := Node clone
    assertTrue( w1 children isEmpty )
    
    w1 addChild( h )
    assertEquals( w1 children size, 1 )
    assertEquals( w1 children first, h )
    assertEquals( h parent, w1 )
    
    w1 addChild( i )
    assertEquals( w1 text, "hi" )
    
    w2 := Node clone do(
      addChild( leaf( "wor" ) )
    )
    
    sentence := Node clone
    sentence addChild( w1 )
    sentence addChild( Node leaf( " " ) )
    sentence addChild( w2 )
    w2 addChild( Node leaf( "ld") )  
    assertEquals( sentence text, "hi world")
  )
)

NodeTester run
"All done" println