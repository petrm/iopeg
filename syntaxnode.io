IoPEG Parser SyntaxNode := Object clone do(
  type := "SyntaxNode"
  HoistError := Exception clone
  init := method(
    self parent     := nil
    self children   := list()
    self attributes := Map clone
    self status := "keep"
  )
  leaf := method( start, close,
    node := self clone
    node start := start
    node close := close
    node
  )
  at    := method( attr, attributes at( attr ) )
  atPut := method( attr, value, attributes atPut( attr, value ) )
  squareBrackets := getSlot( "at" )

  childWithType    := method( desired, children detect( child, child type == desired ) )
  childrenWithType := method( desired, children select( child, child type == desired ) )

  addChild := method( childNode,
    if( childNode shouldHoist,
      childNode children foreach( grandchild,
        self addChild( grandchild )
      )
      nil
    ,
      if( childNode shouldKeep,
        children push( childNode )
        childNode parent := self
      )
      if( childNode shouldExtendParent,
        updateOffsetsFromNode( childNode )
      )
      self
    )
  )

  updateOffsetsFromNode := method( child,
    if( ((child ?start) and (child ?close)) not, return self )
    if( oldStart := self ?start,
      if( child start < self start, start = child start )
    ,
      self start := child start
    )
    if( oldClose := self ?close,
      if( child close > close, close = child close )
    ,
      self close := child close
    )
    if( parent and ((self start != oldStart) or (self close != oldClose)),
      parent updateOffsetsFromNode( self )
    )
    self
  )
  keep    := method( status = "keep"; self )
  skip    := method( if ( status != "fail", status = "extend" ); self )
  ignore  := method( if ( status != "fail", status = "ignore" ); self )
  fail    := method( status = "fail"; self )

  isValid            := method( status != "fail" )
  shouldKeep         := method( status == "keep" )
  shouldExtendParent := method( status == "keep" || status == "extend" )
  shouldHoist        := method( status == "hoist" )
  isHosed            := method( status == "fail" )

  text    := method( ?start and ?close and source ?slice( start, close ) )
  source  := method( ?parent ?source || Object ss )

  # Remove this node, replacing it with its child/children
  # Assumes that the node has not already been added to its parent
  hoist := method(
    if( children size < 1,
      ignore
    ,
      if( children size == 1,
        first := children first
        if( parent, first parent = parent )
        self become( first )
      ,
        # Mark for adding
        status = "hoist"
        self        
      )
    )
    self
  )
  
  replaceChild := method( Exception raise( "SyntaxNode raiseChild not implemented." ) )

  collapse := method(
    self children empty
    self
  )

  asTree := method( depth,
    if( depth not, depth = 0 )
    ("  " repeated(depth) .. asString .. "\n") .. children map( asTree(depth+1) ) join
  )

  showTree := method( asTree println )
  asString := method(
    "<#{self type}#{status != \"keep\" and (\" \"..status) || \"\"}#{attributes map(a,v, \" \" .. a .. \"=\\\"\".. v .. \"\\\"\") join} #{?start}..#{?close} \"#{text ?asMutable ?escape}\">" interpolate
  )
  
  asRange := method( start to( close ) )
)
