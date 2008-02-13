Regex

# namespace
IoPEG := Object clone
IoPEG Parser := Object clone do(
  ParseFailure := Exception clone
  
  parse := method( sourceString,
    # p(sourceString)
    self offset := 0
    self string := sourceString
    
    root := parseRootProduction

    # TODO: track parse failures as they occur; report here.
    if( root == nil, ParseFailure raise( "Failed to parse." ) )

    if( offset != sourceString size,
      # TODO: preference to allow not consuming all text
      ParseFailure raise( "Parsed, but did not consume '#{currentString}'" interpolate )
    )
    root
  )
  
  # Sequentially consume each argument expression,
  # with no backtracking. If any expression returns
  # nil, fail the entire sequence and return nil.
  parse_Sequence := method(
    # writeln( call message )
    initialOffset := offset
    node := SyntaxNode clone
    call message arguments foreach( expression,
      result := expression doInContext( call sender )
      if( result,
        if ( result != true,
          # true is used to indicate an expression that succeeded but consumed no text;
          # produced by zeroOrOne(), zeroOrMore(), ensure() and forbid()
          node addChild( result )
        )
      ,
        offset = initialOffset
        return nil
      )
    )
    # writeln("...#{node}" interpolate)
    node
  )
    
  # Sequentially consume each argument expression.
  # If an expression returns nil, backtrack the offset before trying the next.
  # Return the result of the first expression that does not return nil,
  # or nil if no expression succeeds.
  parse_OrderedChoice := method(
    # writeln( call message )
    initialOffset := offset
    call message arguments foreach( expression,
      result := expression doInContext( call sender )
      if( result,
        # writeln("...#{result}" interpolate)
        return result
      ,
        offset = initialOffset
      )
    )
    # writeln( "...nil" )
    nil
  )

  # Returns true if the expression could not be matched,
  # or a node of the match if it could
  zeroOrOne := method(
    # writeln( call message )
    result := call evalArgAt(0)
    # writeln( "...#{result}" interpolate )    
    if( result, result, true )
  )  

  # Returns true if the expression could not be matched,
  # or a node with child nodes for each match if it could
  zeroOrMore := method(
    # writeln( call message )
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      node addChild( result )
    )
    if( node children isEmpty,
      # writeln( "...true" )    
      true
    ,
      # writeln( "...#{node}" interpolate )    
      node
    )
  )
  
  # Returns a node with child nodes for each match found,
  # or nil if no matches could be found.
  oneOrMore := method(
    # writeln( call message )
    node := SyntaxNode clone
    while( result := call evalArgAt(0),
      node addChild( result )
    )
    if( node children isEmpty,
      # writeln( "...nil" )    
      nil
    ,
      # writeln( "...#{node}" interpolate )    
      node
    )
  )

  # Positive lookahead. Returns true if the expression succeeded, nil otherwise
  ensure := method(
    initialOffset := offset
    result := call evalArgAt(0)
    offset = initialOffset
    if( result, true, nil )
  )

  # Negative lookahead. Returns true if the expression fails, nil otherwise
  forbid := method(
    initialOffset := offset
    result := call evalArgAt(0)
    offset = initialOffset
    if( result, nil, true )
  )

  parse_Regexp := method( regexString,
    # call message println
    matches := currentString matchesOfRegex( "^(?:#{regexString})" interpolate ) all
    if ( matches isNotEmpty,
      match := matches first string
      leaf := SyntaxNode leaf( match, offset )
      offset = offset + match size
      # writeln( "...#{leaf}" interpolate )    
      leaf
    ,
      # writeln( "...nil" )    
      nil
    )
  )
  
  parse_Literal := method( literal,
    # call message println
    if( currentString findSeq( literal ) == 0,
      leaf := SyntaxNode leaf( literal, offset )
      offset = offset + literal size
      # writeln( "...#{leaf}" interpolate )    
      leaf
    ,
      # writeln( "...nil" )    
      nil
    )
  )
  
  parse_Anything := method(
    #TODO: consume a single character and return as a node if possible
  )
  
  # TODO: This may be really heavy
  currentString := method(
    string splitAt( offset ) last
  )
  
  addNode := method( possible )
)
doRelativeFile( "syntaxnode.io" )
doRelativeFile( "utilities.io" )

