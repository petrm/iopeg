IoPEG Parser SyntaxNode := Object clone do(
  HoistError := Exception clone
  init := method(
    self parent     := nil
    self children   := list()
    self resultStatus := "keep"
  )
  leaf := method( start, close,
    node := self clone
    node start := start
    node close := close
    node
  )

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
  keep    := method( resultStatus = "keep"; self )
  skip    := method( if ( resultStatus != "fail", resultStatus = "extend" ); self )
  ignore  := method( if ( resultStatus != "fail", resultStatus = "ignore" ); self )
  fail    := method( resultStatus = "fail"; self )

  isValid            := method( resultStatus != "fail" )
  shouldKeep         := method( resultStatus == "keep" )
  shouldExtendParent := method( resultStatus == "keep" || resultStatus == "extend" )
  shouldHoist        := method( resultStatus == "hoist" )
  isHosed            := method( resultStatus == "fail" )

  text    := method( ?start and ?close and source ?slice( start, close ) )
  source  := method( ?parent ?source || Object ss )

  # Merge any nodes with a single child with the parent node
  # FIXME: this causes some infinite call stack or something
  # compact := method(
  #   "Compacting '#{self}'" interpolate println
  #   if( children size == 1,
  #     myParent := parent
  #     self mergeWith( children first )
  #     parent := myParent
  #     children foreach( parent := self )
  #   )
  #   children foreach( compact )
  #   self
  # )
  
  # Remove this node, replacing it with its child/children
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
        resultStatus = "hoist"
        self        
      )
    )
    self
  )
  #   if( children size < 1,
  #     ignore
  #   ,
  #     if( children size == 1,
  #       first := children first
  #       if( parent, first parent = parent )
  #       self become( first )
  #     ,
  #       if( parent,
  #         parent replaceChild( self, self children )
  #         parent
  #       ,
  #         # Mark for adding
  #         #resultStatus = "hoist"
  #         self
  #       )
  #     )
  #   )
  # )
  
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
    id := ?name || "#{self type}_0x#{uniqueId asHex}" interpolate
    "<#{id} #{?resultStatus} #{?start}..#{?close} \"#{text ?asMutable ?escape}\" #{children size} children>" interpolate
  )
  asRange := method( start to( close ) )
)
