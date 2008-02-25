IoPEGParser

TestPEGParser := UnitTest clone do(  
	test1_parsing := method(
		assertParses( File with( "IoPEG.peg" ) contents )
		assertParses( File with( "eng.peg" ) contents )
	)
	
	assertParses := method( str,
		assertNotNil( IoPEGParser parse( str ) )
	)
	
	assertParseFailure := method( str,
		assertRaisesException( IoPEGParser parse( str ) )
	)
)
TestPEGParser run

# IoPEGParser parse( File with( "eng.peg" ) contents ) showTree
#=> <Grammar 0..282 "sentence              <- capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation\ncapitalized_word      <- [A-Z] word?\nword                  <- [A-Za-z]+\nspace                 <- ' '\nterminal_punctuation  <- '.' / '!' / '?'\ninline_punctuation    <- [,;:">
#=>   <Definition 0..110 "sentence              <- capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation">
#=>     <Identifier 0..8 "sentence">
#=>     <Expression 25..110 "capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation">
#=>       <Sequence 25..110 "capitalized_word ( space word inline_punctuation / space word )* terminal_punctuation">
#=>         <Primary 25..41 "capitalized_word">
#=>           <Identifier 25..41 "capitalized_word">
#=>         <Primary 44..89 "space word inline_punctuation / space word )*">
#=>           <Group 44..86 "space word inline_punctuation / space word">
#=>             <Expression 44..86 "space word inline_punctuation / space word">
#=>               <Sequence 44..73 "space word inline_punctuation">
#=>                 <Primary 44..49 "space">
#=>                   <Identifier 44..49 "space">
#=>                 <Primary 50..54 "word">
#=>                   <Identifier 50..54 "word">
#=>                 <Primary 55..73 "inline_punctuation">
#=>                   <Identifier 55..73 "inline_punctuation">
#=>               <Sequence 76..86 "space word">
#=>                 <Primary 76..81 "space">
#=>                   <Identifier 76..81 "space">
#=>                 <Primary 82..86 "word">
#=>                   <Identifier 82..86 "word">
#=>           <Suffix 88..89 "*">
#=>         <Primary 90..110 "terminal_punctuation">
#=>           <Identifier 90..110 "terminal_punctuation">
#=>   <Definition 111..147 "capitalized_word      <- [A-Z] word?">
#=>     <Identifier 111..127 "capitalized_word">
#=>     <Expression 137..147 "A-Z] word?">
#=>       <Sequence 137..147 "A-Z] word?">
#=>         <Primary 137..140 "A-Z">
#=>           <CLASS 137..140 "A-Z">
#=>         <Primary 142..147 "word?">
#=>           <Identifier 142..146 "word">
#=>           <Suffix 146..147 "?">
#=>   <Definition 148..182 "word                  <- [A-Za-z]+">
#=>     <Identifier 148..152 "word">
#=>     <Expression 174..182 "A-Za-z]+">
#=>       <Sequence 174..182 "A-Za-z]+">
#=>         <Primary 174..182 "A-Za-z]+">
#=>           <CLASS 174..180 "A-Za-z">
#=>           <Suffix 181..182 "+">
#=>   <Definition 183..210 "space                 <- ' ">
#=>     <Identifier 183..188 "space">
#=>     <Expression 209..210 " ">
#=>       <Sequence 209..210 " ">
#=>         <Primary 209..210 " ">
#=>           <LITERAL 209..210 " ">
#=>   <Definition 212..251 "terminal_punctuation  <- '.' / '!' / '?">
#=>     <Identifier 212..232 "terminal_punctuation">
#=>     <Expression 238..251 ".' / '!' / '?">
#=>       <Sequence 238..239 ".">
#=>         <Primary 238..239 ".">
#=>           <LITERAL 238..239 ".">
#=>       <Sequence 244..245 "!">
#=>         <Primary 244..245 "!">
#=>           <LITERAL 244..245 "!">
#=>       <Sequence 250..251 "?">
#=>         <Primary 250..251 "?">
#=>           <LITERAL 250..251 "?">
#=>   <Definition 253..282 "inline_punctuation    <- [,;:">
#=>     <Identifier 253..271 "inline_punctuation">
#=>     <Expression 279..282 ",;:">
#=>       <Sequence 279..282 ",;:">
#=>         <Primary 279..282 ",;:">
#=>           <CLASS 279..282 ",;:">

