/*
sentence              <- capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation
capitalized_word      <- [A-Z] Word?
word                  <- [A-Za-z]+
space                 <- ' '
terminal_punctuation  <- '.' / '!' / '?'
inline_punctuation    <- [,;:]
*/

#TODO: then start memoizing that.

IoPEG

SentenceParser := IoPEG Parser clone do(  
  parseSentence := method(
    seq(
      parseCapitalizedWord,
      star( parseSentenceAlternation1 ),
      parseTerminalPunctuation
    )
  )
  
  parseRootProduction := getSlot( "parseSentence" )
  
  parseSentenceAlternation1 := method(
    choice(
      seq( parseSpace, parseWord, parseInlinePunctuation ),
      seq( parseSpace, parseWord )
    )
  )
  
  parseCapitalizedWord := method(
    seq(
      regex( "[A-Z]" ),
      optional( parseWord )
    )
  )

  parseWord := method(
    regex( "[A-Za-z]+" )
  )
  
  parseSpace := method(
    str( " " )
  )
  
  parseTerminalPunctuation := method(
    choice(
      str( "." ),
      str( "!" ),
      str( "?" )
    )
  )
  
  parseInlinePunctuation := method(
    regex( "[,;:]" )
  )
)
