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
			star( parseSentenceAlternation1 ) hoist,
			parseTerminalPunctuation
		) do( type:="Sentence" )
	)
	
	parseSentenceAlternation1 := method(
		choice(
			seq( parseSpace, parseWord, parseInlinePunctuation ),
			seq( parseSpace, parseWord )
		) hoist
	)
	
	parseCapitalizedWord := method(
		seq( regex("[A-Z]"), optional( parseWord ) ) collapse do( type:="Word" )
	)

	parseWord := method(
		regex( "[A-Za-z]+" ) do( type:="Word" )
	)
	
	parseSpace := method(
		str( " " ) ignore
	)
	
	parseTerminalPunctuation := method(
		choice(
			str( "." ),
			str( "!" ),
			str( "?" )
		) do( type:="TerminalPunctuation" )
	)
	
	parseInlinePunctuation := method(
		regex( "[,;:]" ) do( type:="InlinePunctuation" )
	)

	parseRootProduction := getSlot( "parseSentence" )
)
