IoPEG Parser SyntaxNode := Object clone do(
  init := method(
    self parent     := nil
    self children   := list()
  )
  leaf := method( text, offset,
    node := self clone
    node text   := text
    node offset := offset
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
  # Explicitly overridden by values on leaf nodes
  text   := method( children map( text ) join )
  offset := method( children first offset )
  size   := method( text size )
    
  showTree := method( depth,
    if( depth not, depth = 0 )
    ("  " repeated(depth) .. asString) println
    children foreach( showTree(depth+1) )
  )
  
  asString := method( "<#{self type}_0x#{uniqueId asHex} '#{text asMutable escape}' #{children size} children>" interpolate )
)