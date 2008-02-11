/*
Sentence         <- CapitalizedWord ( Word / Space )* Punctuation
CapitalizedWord  <- [A-Z] Word?
Word             <- [A-Za-z]+
Space            <- ' '
Punctuation      <- '.' / '!' / '?'
*/

#TODO: Allow backtracking by passing offset around
#TODO: then start memoizing that.

IoPEG

SentenceParser := IoPEG Parser clone do(
  ParseFailure := Exception clone
  parse := method( grammarString,
    self offset      := 0
    self parseString := grammarString
    root := parseSentence
    #p(grammarString,root)
    if( root not, ParseFailure raise( "Failed to parse." ) )
    # TODO: track parse failures as they occur; report here.
    if( offset != grammarString size,
      # TODO: preference to allow not consuming all text
      ParseFailure raise( "Parsed, but did not consume '#{currentString}'" interpolate )
    )
    root    
  )
  parseSentence := method(
    node := SyntaxNode clone
    node addChild( parseCapitalizedWord ) or return nil
    while( node addChild( firstNonNil( parseWord, parseSpace ) ), true )
    node addChild( parsePunctuation ) or return nil
    node
  )
  parseCapitalizedWord := method(
    node := SyntaxNode clone
    node addChild( parse_Regexp( "[A-Z]" ) ) or return nil
    node addChild( parseWord ) # optional; no fail
    node
  )
  parseWord := method(
    parse_Regexp( "[A-Za-z]+" )
  )
  parseSpace := method(
    parse_Literal( " " )
  )
  parsePunctuation := method(
    firstNonNil( parse_Literal( "." ), parse_Literal( "!" ), parse_Literal( "?" ), nil )
  )

  parse_Regexp := method( regexString,
    matches := currentString matchesOfRegex( "^(?:#{regexString})" interpolate ) all
    if ( matches isNotEmpty,
      match := matches first string
      leaf := SyntaxNode leaf( match, offset )
      offset = offset + match size
      leaf
    ,
      nil
    )
  )
  parse_Literal := method( literal,
    if( currentString findSeq( literal ) == 0,
      leaf := SyntaxNode leaf( literal, offset )
      offset = offset + literal size
      leaf
    ,
      nil
    )
  )
  currentString := method(
    parseString splitAt( offset ) last
  )
)
