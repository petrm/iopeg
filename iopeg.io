Regex

# namespace
IoPEG := Object clone
IoPEG Parser := Object clone do(
  ParseFailure := Exception clone
  
  parse := method( sourceString,
    self offset := 0
    self failAt := -1
    self failString := "@@@"
    self failStack  := "WTF"
    self partialTree := nil
    self sourceString := sourceString
    if( DEBUG_ON, DEBUG methodStart )
    
    root := parseRootProduction

    # TODO: track parse failures as they occur; report here.
    if( root == nil,
      writeln( "Stopped parsing at: '#{failString slice(0, 40) asMutable escape}'" interpolate )
      writeln( "Current call stack:\n#{failStack}\n" interpolate )
      writeln( "Parse tree so far:" )
      rootroot showTree
      ParseFailure raise
    )

    if( offset != sourceString size,
      # TODO: preference to allow not consuming all text
      ParseFailure raise( "Parsed, but did not consume '#{sourceString}'" interpolate )
    )
    root
  )
  
  failedOn := method( expr,
    if( offset >= failAt,
      failAt = offset
      failString = currentString
      failStack = call sender call callStack reverse map( message ) join( "\n" )
    )
  )
  
  # Sequentially consume each argument expression,
  # with no backtracking. If any expression returns
  # nil, fail the entire sequence and return nil.
  seq := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    node := SyntaxNode clone
    if( self hasSlot("rootroot") not, self rootroot := node )
    call message arguments foreach( expression,
      result := expression doInContext( call sender )
      #if( DEBUG_ON, "..[seq] #{expression} yielded #{result}" interpolate println )
      if( result,
        if ( result != true,
          # true is used to indicate an expression that succeeded but consumed no text;
          # produced by optional(), star(), ensure() and forbid()
          node addChild( result )
        )
      ,
        failedOn( expression )
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
    failedOn( call message )
    if( DEBUG_ON, DEBUG returns(nil) )
    nil
  )

  # Returns true if the expression could not be matched,
  # or a node of the match if it could
  optional := method(
    if( DEBUG_ON, DEBUG methodStart )
    result := call evalArgAt(0)
    result = if( result, result, true )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )  

  # Returns true if the expression could not be matched,
  # or a node with child nodes for each match if it could
  star := method(
    if( DEBUG_ON, DEBUG methodStart )
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      node addChild( result )
    )
    result := if( node children isEmpty, true, node )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )
  
  # Returns a node with child nodes for each match found,
  # or nil if no matches could be found.
  plus := method(
    if( DEBUG_ON, DEBUG methodStart )
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      node addChild( result )
    )
    result := if( node children isEmpty,
      failedOn( call message )
      nil
    , 
      node
    )
    if( DEBUG_ON, DEBUG returns(result) )
    result
  )

  # Positive lookahead. Returns true if the expression succeeded, nil otherwise
  ensure := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    result := call evalArgAt(0)
    result = if( result,
      true
    ,
      failedOn( call message )
      nil
    )
    if( DEBUG_ON, DEBUG returns(result) )
    offset = initialOffset
    result
  )

  # Negative lookahead. Returns true if the expression fails, nil otherwise
  forbid := method(
    if( DEBUG_ON, DEBUG methodStart )
    initialOffset := offset
    result := call evalArgAt(0)
    result = if( result,
      failedOn( call message )
      nil
    ,
      true
    )
    if( DEBUG_ON, DEBUG returns(result) )
    offset = initialOffset
    result
  )

  regex := method( regexString,
    # if( DEBUG_ON, DEBUG methodStart )
    matches := currentString matchesOfRegex( "^(?:#{regexString})" interpolate ) all
    if ( matches isNotEmpty,
      match := matches first string
      result := SyntaxNode leaf( match, offset )
      offset = offset + match size
    ,
      failedOn( call message )
      result := nil
    )
    if( DEBUG_ON, DEBUG returns2(result) )
    result
  )
  
  str := method( literal,
    # if( DEBUG_ON, DEBUG methodStart )
    if( currentString findSeq( literal ) == 0,
      result := SyntaxNode leaf( literal, offset )
      offset = offset + literal size
    ,
      failedOn( call message )
      result := nil
    )
    if( DEBUG_ON, DEBUG returns2(result) )
    result
  )
  
  any := method(
    if( DEBUG_ON, DEBUG methodStart )
    if( offset < sourceString size,
      result := SyntaxNode leaf( sourceString slice( offset, offset + 1 ), offset )
      offset = offset + 1
    ,
      failedOn( call message )
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

