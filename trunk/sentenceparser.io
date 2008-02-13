/*
sentence              <- capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation
capitalized_word      <- [A-Z] Word?
word                  <- [A-Za-z]+
space                 <- ' '
terminal_punctuation  <- '.' / '!' / '?'
inline_punctuation    <- [,;:]
*/

#TODO: Allow backtracking by passing offset around
#TODO: then start memoizing that.

IoPEG

SentenceParser := IoPEG Parser clone do(  
  parseSentence := method(
    parse_Sequence(
      parseCapitalizedWord,
      zeroOrMore( parseSentenceAlternation1 ),
      parseTerminalPunctuation
    )
  )
  
  parseRootProduction := getSlot( "parseSentence" )
  
  parseSentenceAlternation1 := method(
    parse_OrderedChoice(
      parse_Sequence( parseSpace, parseWord, parseInlinePunctuation ),
      parse_Sequence( parseSpace, parseWord )
    )
  )
  
  parseCapitalizedWord := method(
    parse_Sequence(
      parse_Regexp( "[A-Z]" ),
      zeroOrOne( parseWord )
    )
  )

  parseWord := method(
    parse_Regexp( "[A-Za-z]+" )
  )
  
  parseSpace := method(
    parse_Literal( " " )
  )
  
  parseTerminalPunctuation := method(
    parse_OrderedChoice(
      parse_Literal( "." ),
      parse_Literal( "!" ),
      parse_Literal( "?" )
    )
  )
  
  parseInlinePunctuation := method(
    parse_Regexp( "[,;:]" )
  )
)
