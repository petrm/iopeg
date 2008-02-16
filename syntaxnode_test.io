IoPEG

IoPEG SyntaxNodeTester := UnitTest clone do(  
  Node := IoPEG Parser SyntaxNode
  test1_tree := method(
    h := Node leaf( 0, 1 )
    assertEquals( h start, 0 )
    
    i := Node leaf( 1, 2 )
    w1 := Node clone
    assertTrue( w1 children isEmpty )
    
    w1 addChild( h )
    assertEquals( w1 children size, 1 )
    assertEquals( w1 children first, h )
    assertEquals( h parent, w1 )
    
    w1 addChild( i )
    
    w2 := Node clone do(
      addChild( leaf( 3, 6 ) )
    )
    
    sentence := Node clone do( source := "hi world" )
    sentence addChild( w1 )
    sentence addChild( Node leaf( 2, 3 ) )
    sentence addChild( w2 )
    w2 addChild( Node leaf( 6,8 ) )  
    assertEquals( sentence text, "hi world")
    assertEquals( h text, "h" )
    assertEquals( w1 text, "hi" )
    
    tree := sentence asTree
    lines := tree splitNoEmpties( "\r\n", "\n", "\r" )
    assertEquals( lines size, 8 )
  )
  
  test2_compact := method(
    hi := Node leaf( 0, 2 )
    there := Node leaf( 3, 8 )
    world := Node leaf( 9, 14 )
    sentence := Node clone do( source := "hi there world" )
    p1 := Node clone
    p2 := Node clone
    p3 := Node clone
    p4 := Node clone
    sentence addChild( p1 )
    p1 addChild( p2 )
    p1 addChild( p3 )
    p2 addChild( hi )
    p2 addChild( there )
    p3 addChild( p4 )
    p4 addChild( world )
    
    sentence showTree
    sentence compact
    sentence showTree
    tree := sentence asTree
    lines := tree splitNoEmpties( "\r\n", "\n", "\r" )
    assertEquals( lines size, 5 )
  )
)

IoPEG SyntaxNodeTester run
