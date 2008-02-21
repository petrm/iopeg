Regex

# namespace
IoPEG := Object clone
IoPEG Parser := Object clone do(
  ParseFailure := Exception clone
  
  parse := method( sourceString,
    self offset := 0
    self failOffset := -1
    self failMessages  := list
    self partialTree := nil
    self sourceString := sourceString
    if( DEBUG_ON, DEBUG methodStart )
    
    Object ss := sourceString
    root := parseRootProduction
    root source := sourceString
    
    if( root == nil,
      truncateChars := 40
      offset = failOffset
      msg := "Failed to parse '#{call message argAt(0)}' @ char ##{offset}\n" interpolate
      msg = msg .. "stopped parsing at: '#{currentString slice( 0, truncateChars ) asMutable escape}'\n" interpolate
      msg = msg .. failMessages reverse join( "\n" )
      ParseFailure raise( msg )
    )

    if( offset != sourceString size,
      # TODO: preference to allow not consuming all text
      ParseFailure raise( "Parsed, but did not consume '#{sourceString}'" interpolate )
    )
    root
  )
  
  failedAt := method( offset, message,
    if( offset < failOffset, return )
    if ( offset > failOffset, failMessages empty )
    failOffset = offset
    failMessages push( message )
    nil
  )
  
  # Sequentially consume each argument expression,
  # with no backtracking. If any expression returns
  # nil, fail the entire sequence and return nil.
  seq := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    node := SyntaxNode clone
    call message arguments foreach( expression,
      result := expression doInContext( call sender )
      #if( DEBUG_ON, "..[seq] #{expression} yielded #{result}" interpolate println )
      if( result,
        node addChild( result )
      ,
        failedAt( offset, "Could not match '#{expression}' in #{call message}" interpolate )
        offset = initialOffset
        if( DEBUG_ON, DEBUG returns(nil) )
        return nil
      )
    )
    if( DEBUG_ON, DEBUG returns(node) )
    node
  )
    
  # Sequentially consume each argument expression.
  # If an expression returns nil, backtrack the offset before trying the next.
  # Return the result of the first expression that does not return nil,
  # or nil if no expression succeeds.
  choice := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    call message arguments foreach( expression,
      result := expression doInContext( call sender )
      #if( DEBUG_ON, "..[choice] #{expression} yielded #{result}" interpolate println )
      if( result,
        if( DEBUG_ON, DEBUG returns(result) )
        return result
      ,
        offset = initialOffset
      )
    )
    failedAt( offset, "Could not match any of: #{call message arguments map( a, \"'\" .. a asString .. \"'\") join(\", \")}" interpolate )
    if( DEBUG_ON, DEBUG returns(nil) )
    nil
  )

  # Returns a node with child nodes for each match found,
  # a non-zero range if all matches returned ranges,
  # or nil if no matches could be found.
  plus := method(
    if( DEBUG_ON, DEBUG methodStart )
    anySuccess := false
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      # includes range-returning successes
      # which may not result in an actual child addition
      anySuccess = true
      node addChild( result )
    )
    result := if( anySuccess,
      if ( node children isEmpty,
        node asRange
      ,
        node
      )
    , 
      failedAt( offset, "Could not find one or more #{call message argAt(0)}" interpolate )
      nil
    )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )

  # Returns an (empty) range if the expression could not be matched,
  # a non-zero range if all matches also returned a range,
  # or a node with child nodes for each match that succeeded
  star := method(
    if( DEBUG_ON, DEBUG methodStart )
    anySuccess := false
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      anySuccess = true
      node addChild( result )
    )
    result := if( anySuccess,
      if ( node children isEmpty,
        node asRange
      ,
        node
      )
    ,
      offset to(offset)
    )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )
  
  # Returns an (empty) range if the expression could not be matched,
  # or the range or node of the match if it could
  optional := method(
    if( DEBUG_ON, DEBUG methodStart )
    result := call evalArgAt(0) || ( offset to(offset) )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )  

  # Positive lookahead. Returns an empty range if the expression succeeded, nil otherwise.
  ensure := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    result := call evalArgAt(0) and (initialOffset to(initialOffset))
    offset = initialOffset
    if( result not, failedAt( offset, "Could not ensure '#{call message argAt(0)}'" interpolate ) )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )

  # Negative lookahead. Returns an empty range if the expression fails, nil otherwise.
  forbid := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    result := call evalArgAt(0)
    offset = initialOffset
    result = if( result,
      failedAt( offset, "Found forbidden '#{call message argAt(0)}'" interpolate )
      nil
    ,
      initialOffset to(initialOffset)
    )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )

  regex := method( regexString,
    # if( DEBUG_ON, DEBUG methodStart )
    matches := currentString matchesOfRegex( "^(?:#{regexString})" interpolate ) all
    if ( matches isNotEmpty,
      match := matches first string
      result := SyntaxNode leaf( offset, offset + match size )
      offset = offset + match size
    ,
      failedAt( offset, "Could not match regex '#{regexString asMutable escape}'" interpolate )
      result := nil
    )
    if( DEBUG_ON, DEBUG returns2(result) )
    result
  )
  
  str := method( literal,
    # if( DEBUG_ON, DEBUG methodStart )
    if( currentString findSeq( literal ) == 0,
      result := SyntaxNode leaf( offset, offset + literal size )
      offset = offset + literal size
    ,
      failedAt( offset, "Could not match string '#{literal asMutable escape}'" interpolate )
      result := nil
    )
    if( DEBUG_ON, DEBUG returns2(result) )
    result
  )
  
  any := method(
    if( DEBUG_ON, DEBUG methodStart )
    if( offset < sourceString size,
      result := SyntaxNode leaf( offset, offset + 1 )
      offset = offset + 1
    ,
      failedAt( offset, "Could not match . (end of input hit)" )
      result := nil
    )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )
  
  # TODO: This may be really heavy
  currentString := method(
    sourceString splitAt( offset ) last
  )
  
  addNode := method( possible )
)
doRelativeFile( "syntaxnode.io" )
doRelativeFile( "utilities.io" )

