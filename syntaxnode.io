IoPEG Parser SyntaxNode := Object clone do(
  init := method(
    self parent     := nil
    self children   := list()
  )
  leaf := method( start, close,
    node := self clone
    node start := start
    node close := close
    node
  )
  # Passing a Range will update the node and its ancestors
  # to cover the range of offsets, without adding a child node.
  addChild := method( childNodeOrRange,
    if( childNodeOrRange not, return childNodeOrRange )
    if( childNodeOrRange isKindOf(Range),
      updateOffsetsFromRange( childNodeOrRange )
    ,
      children push( childNodeOrRange )
      childNodeOrRange parent := self      
      if( childNodeOrRange = childNodeOrRange asRange,
        updateOffsetsFromRange( childNodeOrRange )
      )
    )
    self
  )
  
  updateOffsetsFromRange := method( range,    
    if( oldStart := self ?start,
      if( range first < start, start = range first )
    ,
      self start := range first
    )
    if( oldClose := self ?close,
      if( range last > close, close = range last )
    ,
      self close := range last
    )
    if( parent and ((start != oldStart) or (close != oldClose)),
      parent updateOffsetsFromRange( range )
    )
    self    
  )
  
  text    := method( source ?slice( start, close ) )
  asRange := method( start to(close) )
  source  := method( ?parent ?source || ss )
    
  # Merge any nodes with a single child with the parent node
  # FIXME: this causes some infinite call stack or something
  compact := method(
    "Compacting '#{self}'" interpolate println
    if( children size == 1,
      myParent := parent
      self mergeWith( children first )
      parent := myParent
      children foreach( parent := self )
    )
    children foreach( compact )
    self
  )
  
  collapse := method(
    self start := start
    self close := close
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
    "<#{id} #{?start}..#{?close} '#{text ?asMutable ?escape}' #{children size} children>" interpolate )
)

Range asRange := method( self )