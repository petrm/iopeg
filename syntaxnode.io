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
  addChild := method( kid,
    if(kid==true,
      call message arguments first println
    )
    if( kid, children push( kid ) )
    kid parent := self
    kid
  )
  text  := method( source slice( start, close ) )
  size  := method( close - start )
  asRange := method( start to(close) )
  # Explicitly overridden by values on leaf nodes
  source := method( ?parent ?source )
  start := method( children map( start ) min )
  close := method( children map( close ) max )
    
  # Merge any nodes with a single child with the parent node
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
    "<#{id} '#{text asMutable escape}' #{children size} children>" interpolate )
)