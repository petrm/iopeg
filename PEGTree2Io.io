IoPEGParser createParser := method( fileName,
	grammar := parse( File with( fileName ) contents )
	code := grammar asCode
	# doString( code ) println
	# TODO: option to serialize to disk instead of doString
)

#IoPEGParser createParser( "eng.peg" ) println
#=> SentenceParser := IoPEG Parser clone do(
#=> 	parse_sentence := method( seq( parse_capitalized_word, star( choice( seq( parse_space, parse_word, parse_inline_punctuation ), seq( parse_space, parse_word ) ) ), parse_terminal_punctuation ) )
#=> 	parse_capitalized_word := method( seq( regex("[A-Z]"), optional( parse_word ) ) )
#=> 	parse_word := method( plus( regex("[A-Za-z]") ) )
#=> 	parse_space := method( str(" ") )
#=> 	parse_terminal_punctuation := method( choice( str("."), str("!"), str("?") ) )
#=> 	parse_inline_punctuation := method( regex("[,;:]") )
#=> 	parseRootProduction := getSlot( "parse_sentence" )
#=> )

IoPEGParser createParser( "IoPEG.peg" ) println
#=> GrammarParser := IoPEG Parser clone do(
#=> 	parse_Grammar := method( seq( parse_Spacing, plus( parse_Definition ), parse_EndOfFile ) )
#=> 	parse_Definition := method( seq( parse_Identifier, parse_LEFTARROW, parse_Expression ) )
#=> 	parse_Expression := method( seq( plus( parse_Primary ), star( seq( parse_SLASH, plus( parse_Primary ) ) ) ) )
#=> 	parse_Primary := method( seq( optional( choice( parse_AND, parse_NOT ) ), choice( seq( parse_Identifier, forbid( parse_LEFTARROW ) ), seq( parse_OPEN, parse_Expression, parse_CLOSE ), parse_Literal, parse_Class, parse_DOT ), optional( choice( parse_QUESTION, parse_STAR, parse_PLUS ) ) ) )
#=> 	parse_Identifier := method( seq( parse_IdentStart, star( parse_IdentCont ), parse_Spacing ) )
#=> 	parse_IdentStart := method( regex("[a-zA-Z_]") )
#=> 	parse_IdentCont := method( choice( parse_IdentStart, regex("[0-9]") ) )
#=> 	parse_Literal := method( choice( seq( regex("[']"), star( seq( forbid( regex("[']") ), parse_Char ) ), regex("[']"), parse_Spacing ), seq( regex("[\"]"), star( seq( forbid( regex("[\"]") ), parse_Char ) ), regex("[\"]"), parse_Spacing ) ) )
#=> 	parse_Class := method( seq( str("["), star( seq( forbid( str("]") ), parse_Range ) ), str("]"), parse_Spacing ) )
#=> 	parse_Range := method( choice( seq( parse_Char, str("-"), parse_Char ), parse_Char ) )
#=> 	parse_Char := method( choice( seq( str("\\"), regex("[nrt'\"\\[\\]\\\\]") ), seq( str("\\"), regex("[0-2]"), regex("[0-7]"), regex("[0-7]") ), seq( str("\\"), regex("[0-7]"), optional( regex("[0-7]") ) ), seq( forbid( str("\\") ), any ) ) )
#=> 	parse_LEFTARROW := method( seq( str("<-"), parse_Spacing ) )
#=> 	parse_SLASH := method( seq( str("/"), parse_Spacing ) )
#=> 	parse_AND := method( seq( str("&"), parse_Spacing ) )
#=> 	parse_NOT := method( seq( str("!"), parse_Spacing ) )
#=> 	parse_QUESTION := method( seq( str("?"), parse_Spacing ) )
#=> 	parse_STAR := method( seq( str("*"), parse_Spacing ) )
#=> 	parse_PLUS := method( seq( str("+"), parse_Spacing ) )
#=> 	parse_OPEN := method( seq( str("("), parse_Spacing ) )
#=> 	parse_CLOSE := method( seq( str(")"), parse_Spacing ) )
#=> 	parse_DOT := method( seq( str("."), parse_Spacing ) )
#=> 	parse_Spacing := method( star( choice( parse_Space, parse_Comment ) ) )
#=> 	parse_Comment := method( seq( str("#"), star( seq( forbid( parse_EndOfLine ), any ) ), parse_EndOfLine ) )
#=> 	parse_Space := method( choice( str(" "), str("\t"), parse_EndOfLine ) )
#=> 	parse_EndOfLine := method( choice( str("\r\n"), str("\n"), str("\r") ) )
#=> 	parse_EndOfFile := method( forbid( any ) )
#=> 	parseRootProduction := getSlot( "parse_Grammar" )
#=> )

