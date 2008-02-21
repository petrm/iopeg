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
    ) do( name:="Sentence" )
  )
  
  parseSentenceAlternation1 := method(
    choice(
      seq( parseSpace, parseWord, parseInlinePunctuation ),
      seq( parseSpace, parseWord )
    )
  )
  
  parseCapitalizedWord := method(
    seq( regex("[A-Z]") ?asRange, optional( parseWord ) ?asRange ) do( name:="Word" )
  )

  parseWord := method(
    regex( "[A-Za-z]+" ) do( name:="Word" )
  )
  
  parseSpace := method(
    str( " " ) ?asRange
  )
  
  parseTerminalPunctuation := method(
    choice(
      str( "." ),
      str( "!" ),
      str( "?" )
    ) do( name:="TerminalPunctuation" )
  )
  
  parseInlinePunctuation := method(
    regex( "[,;:]" ) do( name:="InlinePunctuation" )
  )

  parseRootProduction := getSlot( "parseSentence" )
)
