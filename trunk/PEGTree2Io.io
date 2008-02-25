IoPEGParser createParser := method( fileName,
	grammar := parse( File with( fileName ) contents )
	#grammar showTree
	code := grammar asCode	
)

IoPEGParser createParser( "eng.peg" ) println

#=> SentenceParser := IoPEG Parser clone do(
#=> 	parse_sentence := method( seq( parse_capitalized_word, star( choice( seq( parse_space, parse_word, parse_inline_punctuation ), seq( parse_space, parse_word ) ) ), parse_terminal_punctuation ) )
#=> 	parse_capitalized_word := method( seq( regex("[A-Z]"), optional( parse_word ) ) )
#=> 	parse_word := method( plus( regex("[A-Za-z]") ) )
#=> 	parse_space := method( str(" ") )
#=> 	parse_terminal_punctuation := method( choice( str("."), str("!"), str("?") ) )
#=> 	parse_inline_punctuation := method( regex("[,;:]") )
#=> 	parseRootProduction := getSlot( "parse_sentence" )
#=> )
