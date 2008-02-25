PEGParser

TestPEGParser := UnitTest clone do(  
	test1_parsing := method(
	assertParses( File with( "PEG.peg" ) contents )
	assertParses( File with( "eng.peg" ) contents )
	)
	
	assertParses := method( str,
		assertNotNil( PEGParser parse( str ) )
	)
	
	assertParseFailure := method( str,
		assertRaisesException( PEGParser parse( str ) )
	)
)
TestPEGParser run

#PEGParser parse( File with( "PEG.peg" ) contents ) showTree
/*
<SyntaxNode_0x634590 0..1213 '# Hierarchical syntax\nGrammar    <- Spacing Definition+ EndOfFile\nDefinition <- Identifier LEFTARROW Expression\nExpression <- Sequence (SLASH Sequence)*\nSequence   <- Prefix*\nPrefix     <- (AND / NOT)? Suffix\nSuffix     <- Primary (QUESTION / STAR / PLUS)?\nPrimary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\nIdentifier <- IdentStart IdentCont* Spacing\nIdentStart <- [a-zA-Z_]\nIdentCont  <- IdentStart / [0-9]\nLiteral    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\nClass      <- '[' (!']' Range)* ']' Spacing\nRange      <- Char '-' Char / Char\nChar       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\nLEFTARROW  <- '<-' Spacing\nSLASH      <- '/' Spacing\nAND        <- '&' Spacing\nNOT        <- '!' Spacing\nQUESTION   <- '?' Spacing\nSTAR       <- '*' Spacing\nPLUS       <- '+' Spacing\nOPEN       <- '(' Spacing\nCLOSE      <- ')' Spacing\nDOT        <- '.' Spacing\nSpacing    <- (Space / Comment)*\nComment    <- '#' (!EndOfLine .)* EndOfLine\nSpace      <- ' ' / '\\t' / EndOfLine\nEndOfLine  <- '\\r\\n' / '\\n' / '\\r'\nEndOfFile  <- !.\n' 2 children>
	<SyntaxNode_0x65e240 0..22 '# Hierarchical syntax\n' 1 children>
		<SyntaxNode_0x3e6e60 0..22 '# Hierarchical syntax\n' 2 children>
			<SyntaxNode_0x3ef2b0 0..1 '#' 0 children>
			<SyntaxNode_0x62a4d0 21..22 '\n' 0 children>
	<SyntaxNode_0x624220 22..1213 'Grammar    <- Spacing Definition+ EndOfFile\nDefinition <- Identifier LEFTARROW Expression\nExpression <- Sequence (SLASH Sequence)*\nSequence   <- Prefix*\nPrefix     <- (AND / NOT)? Suffix\nSuffix     <- Primary (QUESTION / STAR / PLUS)?\nPrimary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\nIdentifier <- IdentStart IdentCont* Spacing\nIdentStart <- [a-zA-Z_]\nIdentCont  <- IdentStart / [0-9]\nLiteral    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\nClass      <- '[' (!']' Range)* ']' Spacing\nRange      <- Char '-' Char / Char\nChar       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\nLEFTARROW  <- '<-' Spacing\nSLASH      <- '/' Spacing\nAND        <- '&' Spacing\nNOT        <- '!' Spacing\nQUESTION   <- '?' Spacing\nSTAR       <- '*' Spacing\nPLUS       <- '+' Spacing\nOPEN       <- '(' Spacing\nCLOSE      <- ')' Spacing\nDOT        <- '.' Spacing\nSpacing    <- (Space / Comment)*\nComment    <- '#' (!EndOfLine .)* EndOfLine\nSpace      <- ' ' / '\\t' / EndOfLine\nEndOfLine  <- '\\r\\n' / '\\n' / '\\r'\nEndOfFile  <- !.\n' 29 children>
		<SyntaxNode_0x63eeb0 22..66 'Grammar    <- Spacing Definition+ EndOfFile\n' 3 children>
			<SyntaxNode_0x6108a0 22..33 'Grammar    ' 3 children>
				<SyntaxNode_0x628f90 22..23 'G' 0 children>
				<SyntaxNode_0x62fbf0 23..29 'rammar' 6 children>
					<SyntaxNode_0x3dd1d0 23..24 'r' 0 children>
					<SyntaxNode_0x648020 24..25 'a' 0 children>
					<SyntaxNode_0x3bff60 25..26 'm' 0 children>
					<SyntaxNode_0x3f3890 26..27 'm' 0 children>
					<SyntaxNode_0x3f49f0 27..28 'a' 0 children>
					<SyntaxNode_0x61dc60 28..29 'r' 0 children>
				<SyntaxNode_0x629770 29..33 '    ' 4 children>
					<SyntaxNode_0x645070 29..30 ' ' 0 children>
					<SyntaxNode_0x61ea80 30..31 ' ' 0 children>
					<SyntaxNode_0x3d3e30 31..32 ' ' 0 children>
					<SyntaxNode_0x648ce0 32..33 ' ' 0 children>
			<SyntaxNode_0x3f09e0 33..36 '<- ' 2 children>
				<SyntaxNode_0x61bcc0 33..35 '<-' 0 children>
				<SyntaxNode_0x2e5a40 35..36 ' ' 1 children>
					<SyntaxNode_0x651380 35..36 ' ' 0 children>
			<SyntaxNode_0x63f0f0 36..66 'Spacing Definition+ EndOfFile\n' 1 children>
				<SyntaxNode_0x6539d0 36..66 'Spacing Definition+ EndOfFile\n' 3 children>
					<SyntaxNode_0x656040 36..44 'Spacing ' 1 children>
						<SyntaxNode_0x645300 36..44 'Spacing ' 1 children>
							<SyntaxNode_0x644810 36..44 'Spacing ' 1 children>
								<SyntaxNode_0x3fae70 36..44 'Spacing ' 3 children>
									<SyntaxNode_0x61abc0 36..37 'S' 0 children>
									<SyntaxNode_0x600370 37..43 'pacing' 6 children>
										<SyntaxNode_0x603590 37..38 'p' 0 children>
										<SyntaxNode_0x64cfd0 38..39 'a' 0 children>
										<SyntaxNode_0x64e070 39..40 'c' 0 children>
										<SyntaxNode_0x6516e0 40..41 'i' 0 children>
										<SyntaxNode_0x6521d0 41..42 'n' 0 children>
										<SyntaxNode_0x637f20 42..43 'g' 0 children>
									<SyntaxNode_0x60bb00 43..44 ' ' 1 children>
										<SyntaxNode_0x626690 43..44 ' ' 0 children>
					<SyntaxNode_0x636410 44..56 'Definition+ ' 1 children>
						<SyntaxNode_0x6494f0 44..56 'Definition+ ' 2 children>
							<SyntaxNode_0x6424a0 44..54 'Definition' 1 children>
								<SyntaxNode_0x3b1ab0 44..54 'Definition' 2 children>
									<SyntaxNode_0x616760 44..45 'D' 0 children>
									<SyntaxNode_0x3f3f40 45..54 'efinition' 9 children>
										<SyntaxNode_0x3e9c30 45..46 'e' 0 children>
										<SyntaxNode_0x6459a0 46..47 'f' 0 children>
										<SyntaxNode_0x63fb20 47..48 'i' 0 children>
										<SyntaxNode_0x658220 48..49 'n' 0 children>
										<SyntaxNode_0x628840 49..50 'i' 0 children>
										<SyntaxNode_0x3aff10 50..51 't' 0 children>
										<SyntaxNode_0x639b60 51..52 'i' 0 children>
										<SyntaxNode_0x657430 52..53 'o' 0 children>
										<SyntaxNode_0x65c410 53..54 'n' 0 children>
							<SyntaxNode_0x62bd70 54..56 '+ ' 2 children>
								<SyntaxNode_0x3ceb90 54..55 '+' 0 children>
								<SyntaxNode_0x396dd0 55..56 ' ' 1 children>
									<SyntaxNode_0x6289f0 55..56 ' ' 0 children>
					<SyntaxNode_0x61e590 56..66 'EndOfFile\n' 1 children>
						<SyntaxNode_0x3eca60 56..66 'EndOfFile\n' 1 children>
							<SyntaxNode_0x638d10 56..66 'EndOfFile\n' 1 children>
								<SyntaxNode_0x65b400 56..66 'EndOfFile\n' 3 children>
									<SyntaxNode_0x60ff30 56..57 'E' 0 children>
									<SyntaxNode_0x3b0e70 57..65 'ndOfFile' 8 children>
										<SyntaxNode_0x3b17f0 57..58 'n' 0 children>
										<SyntaxNode_0x60c2c0 58..59 'd' 0 children>
										<SyntaxNode_0x630e40 59..60 'O' 0 children>
										<SyntaxNode_0x65bb00 60..61 'f' 0 children>
										<SyntaxNode_0x62bec0 61..62 'F' 0 children>
										<SyntaxNode_0x64b3f0 62..63 'i' 0 children>
										<SyntaxNode_0x3ef3d0 63..64 'l' 0 children>
										<SyntaxNode_0x61db40 64..65 'e' 0 children>
									<SyntaxNode_0x3aa4d0 65..66 '\n' 1 children>
										<SyntaxNode_0x658720 65..66 '\n' 0 children>
		<SyntaxNode_0x6466d0 66..112 'Definition <- Identifier LEFTARROW Expression\n' 3 children>
			<SyntaxNode_0x394210 66..77 'Definition ' 3 children>
				<SyntaxNode_0x601e50 66..67 'D' 0 children>
				<SyntaxNode_0x65ebd0 67..76 'efinition' 9 children>
					<SyntaxNode_0x3e4f10 67..68 'e' 0 children>
					<SyntaxNode_0x35a470 68..69 'f' 0 children>
					<SyntaxNode_0x3fbb30 69..70 'i' 0 children>
					<SyntaxNode_0x61d070 70..71 'n' 0 children>
					<SyntaxNode_0x6508e0 71..72 'i' 0 children>
					<SyntaxNode_0x652270 72..73 't' 0 children>
					<SyntaxNode_0x3f52f0 73..74 'i' 0 children>
					<SyntaxNode_0x64f440 74..75 'o' 0 children>
					<SyntaxNode_0x661860 75..76 'n' 0 children>
				<SyntaxNode_0x65f390 76..77 ' ' 1 children>
					<SyntaxNode_0x624f30 76..77 ' ' 0 children>
			<SyntaxNode_0x3d9380 77..80 '<- ' 2 children>
				<SyntaxNode_0x6508a0 77..79 '<-' 0 children>
				<SyntaxNode_0x633720 79..80 ' ' 1 children>
					<SyntaxNode_0x64c4a0 79..80 ' ' 0 children>
			<SyntaxNode_0x628fa0 80..112 'Identifier LEFTARROW Expression\n' 1 children>
				<SyntaxNode_0x655200 80..112 'Identifier LEFTARROW Expression\n' 3 children>
					<SyntaxNode_0x61de10 80..91 'Identifier ' 1 children>
						<SyntaxNode_0x6596c0 80..91 'Identifier ' 1 children>
							<SyntaxNode_0x646ad0 80..91 'Identifier ' 1 children>
								<SyntaxNode_0x3e59c0 80..91 'Identifier ' 3 children>
									<SyntaxNode_0x6510c0 80..81 'I' 0 children>
									<SyntaxNode_0x630350 81..90 'dentifier' 9 children>
										<SyntaxNode_0x646d40 81..82 'd' 0 children>
										<SyntaxNode_0x64ee80 82..83 'e' 0 children>
										<SyntaxNode_0x630cc0 83..84 'n' 0 children>
										<SyntaxNode_0x61f780 84..85 't' 0 children>
										<SyntaxNode_0x3c2f10 85..86 'i' 0 children>
										<SyntaxNode_0x60a250 86..87 'f' 0 children>
										<SyntaxNode_0x3e22f0 87..88 'i' 0 children>
										<SyntaxNode_0x62fd20 88..89 'e' 0 children>
										<SyntaxNode_0x65c500 89..90 'r' 0 children>
									<SyntaxNode_0x64da20 90..91 ' ' 1 children>
										<SyntaxNode_0x633f90 90..91 ' ' 0 children>
					<SyntaxNode_0x3d3460 91..101 'LEFTARROW ' 1 children>
						<SyntaxNode_0x608af0 91..101 'LEFTARROW ' 1 children>
							<SyntaxNode_0x6275e0 91..101 'LEFTARROW ' 1 children>
								<SyntaxNode_0x63d0e0 91..101 'LEFTARROW ' 3 children>
									<SyntaxNode_0x62f4c0 91..92 'L' 0 children>
									<SyntaxNode_0x6341f0 92..100 'EFTARROW' 8 children>
										<SyntaxNode_0x63ddc0 92..93 'E' 0 children>
										<SyntaxNode_0x60d000 93..94 'F' 0 children>
										<SyntaxNode_0x64d540 94..95 'T' 0 children>
										<SyntaxNode_0x613310 95..96 'A' 0 children>
										<SyntaxNode_0x641230 96..97 'R' 0 children>
										<SyntaxNode_0x65e410 97..98 'R' 0 children>
										<SyntaxNode_0x65a100 98..99 'O' 0 children>
										<SyntaxNode_0x3e94d0 99..100 'W' 0 children>
									<SyntaxNode_0x3db870 100..101 ' ' 1 children>
										<SyntaxNode_0x643ef0 100..101 ' ' 0 children>
					<SyntaxNode_0x65d8b0 101..112 'Expression\n' 1 children>
						<SyntaxNode_0x65dce0 101..112 'Expression\n' 1 children>
							<SyntaxNode_0x6416c0 101..112 'Expression\n' 1 children>
								<SyntaxNode_0x660a80 101..112 'Expression\n' 3 children>
									<SyntaxNode_0x3b5c30 101..102 'E' 0 children>
									<SyntaxNode_0x612550 102..111 'xpression' 9 children>
										<SyntaxNode_0x652920 102..103 'x' 0 children>
										<SyntaxNode_0x61f460 103..104 'p' 0 children>
										<SyntaxNode_0x659420 104..105 'r' 0 children>
										<SyntaxNode_0x658950 105..106 'e' 0 children>
										<SyntaxNode_0x6345b0 106..107 's' 0 children>
										<SyntaxNode_0x6142a0 107..108 's' 0 children>
										<SyntaxNode_0x2d4250 108..109 'i' 0 children>
										<SyntaxNode_0x64fe50 109..110 'o' 0 children>
										<SyntaxNode_0x60a8d0 110..111 'n' 0 children>
									<SyntaxNode_0x62b2c0 111..112 '\n' 1 children>
										<SyntaxNode_0x3b1d00 111..112 '\n' 0 children>
		<SyntaxNode_0x667810 112..153 'Expression <- Sequence (SLASH Sequence)*\n' 3 children>
			<SyntaxNode_0x3a7210 112..123 'Expression ' 3 children>
				<SyntaxNode_0x3efac0 112..113 'E' 0 children>
				<SyntaxNode_0x62ddb0 113..122 'xpression' 9 children>
					<SyntaxNode_0x638eb0 113..114 'x' 0 children>
					<SyntaxNode_0x3f7db0 114..115 'p' 0 children>
					<SyntaxNode_0x61a7e0 115..116 'r' 0 children>
					<SyntaxNode_0x64a990 116..117 'e' 0 children>
					<SyntaxNode_0x65ad10 117..118 's' 0 children>
					<SyntaxNode_0x64de30 118..119 's' 0 children>
					<SyntaxNode_0x62b7a0 119..120 'i' 0 children>
					<SyntaxNode_0x6536b0 120..121 'o' 0 children>
					<SyntaxNode_0x621860 121..122 'n' 0 children>
				<SyntaxNode_0x610290 122..123 ' ' 1 children>
					<SyntaxNode_0x616820 122..123 ' ' 0 children>
			<SyntaxNode_0x634d60 123..126 '<- ' 2 children>
				<SyntaxNode_0x63fb10 123..125 '<-' 0 children>
				<SyntaxNode_0x645310 125..126 ' ' 1 children>
					<SyntaxNode_0x3f6100 125..126 ' ' 0 children>
			<SyntaxNode_0x3ac140 126..153 'Sequence (SLASH Sequence)*\n' 1 children>
				<SyntaxNode_0x3c72b0 126..153 'Sequence (SLASH Sequence)*\n' 2 children>
					<SyntaxNode_0x3dbd70 126..135 'Sequence ' 1 children>
						<SyntaxNode_0x638430 126..135 'Sequence ' 1 children>
							<SyntaxNode_0x6569b0 126..135 'Sequence ' 1 children>
								<SyntaxNode_0x625cd0 126..135 'Sequence ' 3 children>
									<SyntaxNode_0x667210 126..127 'S' 0 children>
									<SyntaxNode_0x665f40 127..134 'equence' 7 children>
										<SyntaxNode_0x663150 127..128 'e' 0 children>
										<SyntaxNode_0x6382b0 128..129 'q' 0 children>
										<SyntaxNode_0x63adf0 129..130 'u' 0 children>
										<SyntaxNode_0x6370d0 130..131 'e' 0 children>
										<SyntaxNode_0x628600 131..132 'n' 0 children>
										<SyntaxNode_0x653800 132..133 'c' 0 children>
										<SyntaxNode_0x642e30 133..134 'e' 0 children>
									<SyntaxNode_0x60e4d0 134..135 ' ' 1 children>
										<SyntaxNode_0x3d2f80 134..135 ' ' 0 children>
					<SyntaxNode_0x636650 135..153 '(SLASH Sequence)*\n' 1 children>
						<SyntaxNode_0x3c9320 135..153 '(SLASH Sequence)*\n' 2 children>
							<SyntaxNode_0x6257c0 135..151 '(SLASH Sequence)' 3 children>
								<SyntaxNode_0x6395c0 135..136 '(' 1 children>
									<SyntaxNode_0x64bbb0 135..136 '(' 0 children>
								<SyntaxNode_0x63e040 136..150 'SLASH Sequence' 1 children>
									<SyntaxNode_0x3f4370 136..150 'SLASH Sequence' 2 children>
										<SyntaxNode_0x3a2b20 136..142 'SLASH ' 1 children>
											<SyntaxNode_0x640040 136..142 'SLASH ' 1 children>
												<SyntaxNode_0x667b40 136..142 'SLASH ' 1 children>
													<SyntaxNode_0x653800 136..142 'SLASH ' 3 children>
														<SyntaxNode_0x3c3600 136..137 'S' 0 children>
														<SyntaxNode_0x6603c0 137..141 'LASH' 4 children>
															<SyntaxNode_0x62e1d0 137..138 'L' 0 children>
															<SyntaxNode_0x659d70 138..139 'A' 0 children>
															<SyntaxNode_0x6466a0 139..140 'S' 0 children>
															<SyntaxNode_0x665120 140..141 'H' 0 children>
														<SyntaxNode_0x3e84c0 141..142 ' ' 1 children>
															<SyntaxNode_0x3b8370 141..142 ' ' 0 children>
										<SyntaxNode_0x642f30 142..150 'Sequence' 1 children>
											<SyntaxNode_0x649130 142..150 'Sequence' 1 children>
												<SyntaxNode_0x61ea80 142..150 'Sequence' 1 children>
													<SyntaxNode_0x667ae0 142..150 'Sequence' 2 children>
														<SyntaxNode_0x646830 142..143 'S' 0 children>
														<SyntaxNode_0x3de630 143..150 'equence' 7 children>
															<SyntaxNode_0x3da220 143..144 'e' 0 children>
															<SyntaxNode_0x65a6b0 144..145 'q' 0 children>
															<SyntaxNode_0x61fc70 145..146 'u' 0 children>
															<SyntaxNode_0x662da0 146..147 'e' 0 children>
															<SyntaxNode_0x3a6210 147..148 'n' 0 children>
															<SyntaxNode_0x624220 148..149 'c' 0 children>
															<SyntaxNode_0x63d500 149..150 'e' 0 children>
								<SyntaxNode_0x655520 150..151 ')' 1 children>
									<SyntaxNode_0x64ae10 150..151 ')' 0 children>
							<SyntaxNode_0x3ed290 151..153 '*\n' 2 children>
								<SyntaxNode_0x3eccb0 151..152 '*' 0 children>
								<SyntaxNode_0x6597f0 152..153 '\n' 1 children>
									<SyntaxNode_0x668aa0 152..153 '\n' 0 children>
		<SyntaxNode_0x61d630 153..175 'Sequence   <- Prefix*\n' 3 children>
			<SyntaxNode_0x62e520 153..164 'Sequence   ' 3 children>
				<SyntaxNode_0x64f160 153..154 'S' 0 children>
				<SyntaxNode_0x3a6820 154..161 'equence' 7 children>
					<SyntaxNode_0x650520 154..155 'e' 0 children>
					<SyntaxNode_0x39ab50 155..156 'q' 0 children>
					<SyntaxNode_0x62bbc0 156..157 'u' 0 children>
					<SyntaxNode_0x6497f0 157..158 'e' 0 children>
					<SyntaxNode_0x623bb0 158..159 'n' 0 children>
					<SyntaxNode_0x625ac0 159..160 'c' 0 children>
					<SyntaxNode_0x6183f0 160..161 'e' 0 children>
				<SyntaxNode_0x63afc0 161..164 '   ' 3 children>
					<SyntaxNode_0x3e9f10 161..162 ' ' 0 children>
					<SyntaxNode_0x658a10 162..163 ' ' 0 children>
					<SyntaxNode_0x62a560 163..164 ' ' 0 children>
			<SyntaxNode_0x3e8440 164..167 '<- ' 2 children>
				<SyntaxNode_0x62fda0 164..166 '<-' 0 children>
				<SyntaxNode_0x3c6630 166..167 ' ' 1 children>
					<SyntaxNode_0x3ab970 166..167 ' ' 0 children>
			<SyntaxNode_0x660420 167..175 'Prefix*\n' 1 children>
				<SyntaxNode_0x647db0 167..175 'Prefix*\n' 1 children>
					<SyntaxNode_0x61fc40 167..175 'Prefix*\n' 1 children>
						<SyntaxNode_0x661300 167..175 'Prefix*\n' 2 children>
							<SyntaxNode_0x64dc70 167..173 'Prefix' 1 children>
								<SyntaxNode_0x3d7e50 167..173 'Prefix' 2 children>
									<SyntaxNode_0x3d2ec0 167..168 'P' 0 children>
									<SyntaxNode_0x65ba40 168..173 'refix' 5 children>
										<SyntaxNode_0x667180 168..169 'r' 0 children>
										<SyntaxNode_0x3baae0 169..170 'e' 0 children>
										<SyntaxNode_0x6286e0 170..171 'f' 0 children>
										<SyntaxNode_0x39fd20 171..172 'i' 0 children>
										<SyntaxNode_0x610c60 172..173 'x' 0 children>
							<SyntaxNode_0x655e90 173..175 '*\n' 2 children>
								<SyntaxNode_0x62d730 173..174 '*' 0 children>
								<SyntaxNode_0x648360 174..175 '\n' 1 children>
									<SyntaxNode_0x3abba0 174..175 '\n' 0 children>
		<SyntaxNode_0x642450 175..209 'Prefix     <- (AND / NOT)? Suffix\n' 3 children>
			<SyntaxNode_0x3b9480 175..186 'Prefix     ' 3 children>
				<SyntaxNode_0x3b0800 175..176 'P' 0 children>
				<SyntaxNode_0x395c10 176..181 'refix' 5 children>
					<SyntaxNode_0x623380 176..177 'r' 0 children>
					<SyntaxNode_0x3f1de0 177..178 'e' 0 children>
					<SyntaxNode_0x60f920 178..179 'f' 0 children>
					<SyntaxNode_0x6562e0 179..180 'i' 0 children>
					<SyntaxNode_0x63d3d0 180..181 'x' 0 children>
				<SyntaxNode_0x664190 181..186 '     ' 5 children>
					<SyntaxNode_0x665de0 181..182 ' ' 0 children>
					<SyntaxNode_0x611520 182..183 ' ' 0 children>
					<SyntaxNode_0x6084f0 183..184 ' ' 0 children>
					<SyntaxNode_0x6417d0 184..185 ' ' 0 children>
					<SyntaxNode_0x6133d0 185..186 ' ' 0 children>
			<SyntaxNode_0x6145d0 186..189 '<- ' 2 children>
				<SyntaxNode_0x6538f0 186..188 '<-' 0 children>
				<SyntaxNode_0x2af450 188..189 ' ' 1 children>
					<SyntaxNode_0x2af090 188..189 ' ' 0 children>
			<SyntaxNode_0x660260 189..209 '(AND / NOT)? Suffix\n' 1 children>
				<SyntaxNode_0x62d1c0 189..209 '(AND / NOT)? Suffix\n' 2 children>
					<SyntaxNode_0x619390 189..202 '(AND / NOT)? ' 1 children>
						<SyntaxNode_0x3a0580 189..202 '(AND / NOT)? ' 2 children>
							<SyntaxNode_0x622b50 189..200 '(AND / NOT)' 3 children>
								<SyntaxNode_0x6078b0 189..190 '(' 1 children>
									<SyntaxNode_0x620aa0 189..190 '(' 0 children>
								<SyntaxNode_0x660480 190..199 'AND / NOT' 2 children>
									<SyntaxNode_0x639df0 190..194 'AND ' 1 children>
										<SyntaxNode_0x625b60 190..194 'AND ' 1 children>
											<SyntaxNode_0x3eed90 190..194 'AND ' 1 children>
												<SyntaxNode_0x3f2cf0 190..194 'AND ' 1 children>
													<SyntaxNode_0x631f90 190..194 'AND ' 3 children>
														<SyntaxNode_0x658da0 190..191 'A' 0 children>
														<SyntaxNode_0x3c5690 191..193 'ND' 2 children>
															<SyntaxNode_0x613160 191..192 'N' 0 children>
															<SyntaxNode_0x3d8850 192..193 'D' 0 children>
														<SyntaxNode_0x65d8b0 193..194 ' ' 1 children>
															<SyntaxNode_0x64bd20 193..194 ' ' 0 children>
									<SyntaxNode_0x3dd5b0 194..199 '/ NOT' 1 children>
										<SyntaxNode_0x661ee0 194..199 '/ NOT' 2 children>
											<SyntaxNode_0x3ddef0 194..196 '/ ' 2 children>
												<SyntaxNode_0x62fde0 194..195 '/' 0 children>
												<SyntaxNode_0x65e7f0 195..196 ' ' 1 children>
													<SyntaxNode_0x648710 195..196 ' ' 0 children>
											<SyntaxNode_0x649640 196..199 'NOT' 1 children>
												<SyntaxNode_0x654bc0 196..199 'NOT' 1 children>
													<SyntaxNode_0x609d70 196..199 'NOT' 1 children>
														<SyntaxNode_0x638980 196..199 'NOT' 1 children>
															<SyntaxNode_0x3e42d0 196..199 'NOT' 2 children>
																<SyntaxNode_0x65b7d0 196..197 'N' 0 children>
																<SyntaxNode_0x6406e0 197..199 'OT' 2 children>
																	<SyntaxNode_0x3e65c0 197..198 'O' 0 children>
																	<SyntaxNode_0x3d4bc0 198..199 'T' 0 children>
								<SyntaxNode_0x605aa0 199..200 ')' 1 children>
									<SyntaxNode_0x62f8c0 199..200 ')' 0 children>
							<SyntaxNode_0x64e070 200..202 '? ' 2 children>
								<SyntaxNode_0x63b660 200..201 '?' 0 children>
								<SyntaxNode_0x61cdf0 201..202 ' ' 1 children>
									<SyntaxNode_0x3b53d0 201..202 ' ' 0 children>
					<SyntaxNode_0x652920 202..209 'Suffix\n' 1 children>
						<SyntaxNode_0x639f70 202..209 'Suffix\n' 1 children>
							<SyntaxNode_0x6413d0 202..209 'Suffix\n' 1 children>
								<SyntaxNode_0x6421a0 202..209 'Suffix\n' 3 children>
									<SyntaxNode_0x64f480 202..203 'S' 0 children>
									<SyntaxNode_0x666b40 203..208 'uffix' 5 children>
										<SyntaxNode_0x644960 203..204 'u' 0 children>
										<SyntaxNode_0x2d4250 204..205 'f' 0 children>
										<SyntaxNode_0x646b60 205..206 'f' 0 children>
										<SyntaxNode_0x650e60 206..207 'i' 0 children>
										<SyntaxNode_0x6533f0 207..208 'x' 0 children>
									<SyntaxNode_0x6641a0 208..209 '\n' 1 children>
										<SyntaxNode_0x65b380 208..209 '\n' 0 children>
		<SyntaxNode_0x3efe20 209..257 'Suffix     <- Primary (QUESTION / STAR / PLUS)?\n' 3 children>
			<SyntaxNode_0x3e98d0 209..220 'Suffix     ' 3 children>
				<SyntaxNode_0x3d89a0 209..210 'S' 0 children>
				<SyntaxNode_0x664fc0 210..215 'uffix' 5 children>
					<SyntaxNode_0x61d940 210..211 'u' 0 children>
					<SyntaxNode_0x65c8a0 211..212 'f' 0 children>
					<SyntaxNode_0x65f310 212..213 'f' 0 children>
					<SyntaxNode_0x648ce0 213..214 'i' 0 children>
					<SyntaxNode_0x650ba0 214..215 'x' 0 children>
				<SyntaxNode_0x3c4640 215..220 '     ' 5 children>
					<SyntaxNode_0x64e410 215..216 ' ' 0 children>
					<SyntaxNode_0x62d530 216..217 ' ' 0 children>
					<SyntaxNode_0x3fa030 217..218 ' ' 0 children>
					<SyntaxNode_0x61ba10 218..219 ' ' 0 children>
					<SyntaxNode_0x660070 219..220 ' ' 0 children>
			<SyntaxNode_0x64f160 220..223 '<- ' 2 children>
				<SyntaxNode_0x655730 220..222 '<-' 0 children>
				<SyntaxNode_0x614a40 222..223 ' ' 1 children>
					<SyntaxNode_0x3cf8f0 222..223 ' ' 0 children>
			<SyntaxNode_0x60be00 223..257 'Primary (QUESTION / STAR / PLUS)?\n' 1 children>
				<SyntaxNode_0x3a30f0 223..257 'Primary (QUESTION / STAR / PLUS)?\n' 2 children>
					<SyntaxNode_0x6640d0 223..231 'Primary ' 1 children>
						<SyntaxNode_0x63b3b0 223..231 'Primary ' 1 children>
							<SyntaxNode_0x668ca0 223..231 'Primary ' 1 children>
								<SyntaxNode_0x637710 223..231 'Primary ' 3 children>
									<SyntaxNode_0x63f2e0 223..224 'P' 0 children>
									<SyntaxNode_0x661240 224..230 'rimary' 6 children>
										<SyntaxNode_0x3a61b0 224..225 'r' 0 children>
										<SyntaxNode_0x3f6db0 225..226 'i' 0 children>
										<SyntaxNode_0x654790 226..227 'm' 0 children>
										<SyntaxNode_0x668040 227..228 'a' 0 children>
										<SyntaxNode_0x614120 228..229 'r' 0 children>
										<SyntaxNode_0x6404e0 229..230 'y' 0 children>
									<SyntaxNode_0x6033c0 230..231 ' ' 1 children>
										<SyntaxNode_0x627a70 230..231 ' ' 0 children>
					<SyntaxNode_0x62fcc0 231..257 '(QUESTION / STAR / PLUS)?\n' 1 children>
						<SyntaxNode_0x616700 231..257 '(QUESTION / STAR / PLUS)?\n' 2 children>
							<SyntaxNode_0x660b00 231..255 '(QUESTION / STAR / PLUS)' 3 children>
								<SyntaxNode_0x3e0d50 231..232 '(' 1 children>
									<SyntaxNode_0x635900 231..232 '(' 0 children>
								<SyntaxNode_0x64e500 232..254 'QUESTION / STAR / PLUS' 2 children>
									<SyntaxNode_0x315f90 232..241 'QUESTION ' 1 children>
										<SyntaxNode_0x3ecf30 232..241 'QUESTION ' 1 children>
											<SyntaxNode_0x603ef0 232..241 'QUESTION ' 1 children>
												<SyntaxNode_0x648360 232..241 'QUESTION ' 1 children>
													<SyntaxNode_0x6501c0 232..241 'QUESTION ' 3 children>
														<SyntaxNode_0x65f3a0 232..233 'Q' 0 children>
														<SyntaxNode_0x63bb80 233..240 'UESTION' 7 children>
															<SyntaxNode_0x3ef790 233..234 'U' 0 children>
															<SyntaxNode_0x3f1ac0 234..235 'E' 0 children>
															<SyntaxNode_0x61a7b0 235..236 'S' 0 children>
															<SyntaxNode_0x664480 236..237 'T' 0 children>
															<SyntaxNode_0x654c70 237..238 'I' 0 children>
															<SyntaxNode_0x608c30 238..239 'O' 0 children>
															<SyntaxNode_0x646b60 239..240 'N' 0 children>
														<SyntaxNode_0x668320 240..241 ' ' 1 children>
															<SyntaxNode_0x6268b0 240..241 ' ' 0 children>
									<SyntaxNode_0x662630 241..254 '/ STAR / PLUS' 2 children>
										<SyntaxNode_0x62b7a0 241..248 '/ STAR ' 2 children>
											<SyntaxNode_0x3a2b20 241..243 '/ ' 2 children>
												<SyntaxNode_0x638900 241..242 '/' 0 children>
												<SyntaxNode_0x647b90 242..243 ' ' 1 children>
													<SyntaxNode_0x3daf50 242..243 ' ' 0 children>
											<SyntaxNode_0x651660 243..248 'STAR ' 1 children>
												<SyntaxNode_0x3f2b90 243..248 'STAR ' 1 children>
													<SyntaxNode_0x3a2b20 243..248 'STAR ' 1 children>
														<SyntaxNode_0x6508e0 243..248 'STAR ' 1 children>
															<SyntaxNode_0x62d7f0 243..248 'STAR ' 3 children>
																<SyntaxNode_0x63af80 243..244 'S' 0 children>
																<SyntaxNode_0x3edc40 244..247 'TAR' 3 children>
																	<SyntaxNode_0x3ea770 244..245 'T' 0 children>
																	<SyntaxNode_0x3db8d0 245..246 'A' 0 children>
																	<SyntaxNode_0x656ac0 246..247 'R' 0 children>
																<SyntaxNode_0x66a170 247..248 ' ' 1 children>
																	<SyntaxNode_0x3eed90 247..248 ' ' 0 children>
										<SyntaxNode_0x3c5c10 248..254 '/ PLUS' 2 children>
											<SyntaxNode_0x650600 248..250 '/ ' 2 children>
												<SyntaxNode_0x650ff0 248..249 '/' 0 children>
												<SyntaxNode_0x65d420 249..250 ' ' 1 children>
													<SyntaxNode_0x658410 249..250 ' ' 0 children>
											<SyntaxNode_0x617220 250..254 'PLUS' 1 children>
												<SyntaxNode_0x3ea520 250..254 'PLUS' 1 children>
													<SyntaxNode_0x646ea0 250..254 'PLUS' 1 children>
														<SyntaxNode_0x621b40 250..254 'PLUS' 1 children>
															<SyntaxNode_0x65b490 250..254 'PLUS' 2 children>
																<SyntaxNode_0x66a9f0 250..251 'P' 0 children>
																<SyntaxNode_0x652520 251..254 'LUS' 3 children>
																	<SyntaxNode_0x63da80 251..252 'L' 0 children>
																	<SyntaxNode_0x3ef110 252..253 'U' 0 children>
																	<SyntaxNode_0x659750 253..254 'S' 0 children>
								<SyntaxNode_0x652f50 254..255 ')' 1 children>
									<SyntaxNode_0x3bec90 254..255 ')' 0 children>
							<SyntaxNode_0x3de630 255..257 '?\n' 2 children>
								<SyntaxNode_0x624220 255..256 '?' 0 children>
								<SyntaxNode_0x60fce0 256..257 '\n' 1 children>
									<SyntaxNode_0x3cb740 256..257 '\n' 0 children>
		<SyntaxNode_0x65d2c0 257..387 'Primary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\n' 3 children>
			<SyntaxNode_0x634210 257..268 'Primary    ' 3 children>
				<SyntaxNode_0x63e030 257..258 'P' 0 children>
				<SyntaxNode_0x64c880 258..264 'rimary' 6 children>
					<SyntaxNode_0x3f4d20 258..259 'r' 0 children>
					<SyntaxNode_0x6110e0 259..260 'i' 0 children>
					<SyntaxNode_0x3957b0 260..261 'm' 0 children>
					<SyntaxNode_0x637500 261..262 'a' 0 children>
					<SyntaxNode_0x651b00 262..263 'r' 0 children>
					<SyntaxNode_0x64b230 263..264 'y' 0 children>
				<SyntaxNode_0x668160 264..268 '    ' 4 children>
					<SyntaxNode_0x655220 264..265 ' ' 0 children>
					<SyntaxNode_0x645a20 265..266 ' ' 0 children>
					<SyntaxNode_0x62b450 266..267 ' ' 0 children>
					<SyntaxNode_0x641270 267..268 ' ' 0 children>
			<SyntaxNode_0x3957b0 268..271 '<- ' 2 children>
				<SyntaxNode_0x629770 268..270 '<-' 0 children>
				<SyntaxNode_0x6689c0 270..271 ' ' 1 children>
					<SyntaxNode_0x65ad50 270..271 ' ' 0 children>
			<SyntaxNode_0x6666b0 271..387 'Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\n' 2 children>
				<SyntaxNode_0x659210 271..307 'Identifier !LEFTARROW\n              ' 2 children>
					<SyntaxNode_0x611e10 271..282 'Identifier ' 1 children>
						<SyntaxNode_0x3bf980 271..282 'Identifier ' 1 children>
							<SyntaxNode_0x2ba220 271..282 'Identifier ' 1 children>
								<SyntaxNode_0x6640d0 271..282 'Identifier ' 3 children>
									<SyntaxNode_0x3df780 271..272 'I' 0 children>
									<SyntaxNode_0x63a980 272..281 'dentifier' 9 children>
										<SyntaxNode_0x666ed0 272..273 'd' 0 children>
										<SyntaxNode_0x6685d0 273..274 'e' 0 children>
										<SyntaxNode_0x6296f0 274..275 'n' 0 children>
										<SyntaxNode_0x3f0090 275..276 't' 0 children>
										<SyntaxNode_0x63f760 276..277 'i' 0 children>
										<SyntaxNode_0x645220 277..278 'f' 0 children>
										<SyntaxNode_0x628f40 278..279 'i' 0 children>
										<SyntaxNode_0x655740 279..280 'e' 0 children>
										<SyntaxNode_0x64b170 280..281 'r' 0 children>
									<SyntaxNode_0x607290 281..282 ' ' 1 children>
										<SyntaxNode_0x3e0fc0 281..282 ' ' 0 children>
					<SyntaxNode_0x651b90 282..307 '!LEFTARROW\n              ' 2 children>
						<SyntaxNode_0x661ff0 282..283 '!' 1 children>
							<SyntaxNode_0x61e010 282..283 '!' 0 children>
						<SyntaxNode_0x64c360 283..307 'LEFTARROW\n              ' 1 children>
							<SyntaxNode_0x649d40 283..307 'LEFTARROW\n              ' 1 children>
								<SyntaxNode_0x6218c0 283..307 'LEFTARROW\n              ' 3 children>
									<SyntaxNode_0x63a570 283..284 'L' 0 children>
									<SyntaxNode_0x666c20 284..292 'EFTARROW' 8 children>
										<SyntaxNode_0x60b330 284..285 'E' 0 children>
										<SyntaxNode_0x663990 285..286 'F' 0 children>
										<SyntaxNode_0x64e090 286..287 'T' 0 children>
										<SyntaxNode_0x653680 287..288 'A' 0 children>
										<SyntaxNode_0x643ba0 288..289 'R' 0 children>
										<SyntaxNode_0x61bb50 289..290 'R' 0 children>
										<SyntaxNode_0x6388a0 290..291 'O' 0 children>
										<SyntaxNode_0x3d32e0 291..292 'W' 0 children>
									<SyntaxNode_0x65ee30 292..307 '\n              ' 15 children>
										<SyntaxNode_0x64c360 292..293 '\n' 0 children>
										<SyntaxNode_0x656d60 293..294 ' ' 0 children>
										<SyntaxNode_0x61f240 294..295 ' ' 0 children>
										<SyntaxNode_0x3d4bc0 295..296 ' ' 0 children>
										<SyntaxNode_0x651280 296..297 ' ' 0 children>
										<SyntaxNode_0x62d950 297..298 ' ' 0 children>
										<SyntaxNode_0x63fb20 298..299 ' ' 0 children>
										<SyntaxNode_0x614a80 299..300 ' ' 0 children>
										<SyntaxNode_0x633bc0 300..301 ' ' 0 children>
										<SyntaxNode_0x3eac20 301..302 ' ' 0 children>
										<SyntaxNode_0x6265f0 302..303 ' ' 0 children>
										<SyntaxNode_0x662510 303..304 ' ' 0 children>
										<SyntaxNode_0x655f60 304..305 ' ' 0 children>
										<SyntaxNode_0x3d6df0 305..306 ' ' 0 children>
										<SyntaxNode_0x633a00 306..307 ' ' 0 children>
				<SyntaxNode_0x617020 307..387 '/ OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\n' 4 children>
					<SyntaxNode_0x6003b0 307..345 '/ OPEN Expression CLOSE\n              ' 2 children>
						<SyntaxNode_0x61c620 307..309 '/ ' 2 children>
							<SyntaxNode_0x663320 307..308 '/' 0 children>
							<SyntaxNode_0x640f80 308..309 ' ' 1 children>
								<SyntaxNode_0x65ee20 308..309 ' ' 0 children>
						<SyntaxNode_0x658ed0 309..345 'OPEN Expression CLOSE\n              ' 3 children>
							<SyntaxNode_0x656580 309..314 'OPEN ' 1 children>
								<SyntaxNode_0x617060 309..314 'OPEN ' 1 children>
									<SyntaxNode_0x6235b0 309..314 'OPEN ' 1 children>
										<SyntaxNode_0x3c9460 309..314 'OPEN ' 3 children>
											<SyntaxNode_0x634250 309..310 'O' 0 children>
											<SyntaxNode_0x651100 310..313 'PEN' 3 children>
												<SyntaxNode_0x3abb80 310..311 'P' 0 children>
												<SyntaxNode_0x654bd0 311..312 'E' 0 children>
												<SyntaxNode_0x6083f0 312..313 'N' 0 children>
											<SyntaxNode_0x2ada40 313..314 ' ' 1 children>
												<SyntaxNode_0x63e5a0 313..314 ' ' 0 children>
							<SyntaxNode_0x6602c0 314..325 'Expression ' 1 children>
								<SyntaxNode_0x61b7e0 314..325 'Expression ' 1 children>
									<SyntaxNode_0x65f0c0 314..325 'Expression ' 1 children>
										<SyntaxNode_0x3c4390 314..325 'Expression ' 3 children>
											<SyntaxNode_0x62c700 314..315 'E' 0 children>
											<SyntaxNode_0x614ae0 315..324 'xpression' 9 children>
												<SyntaxNode_0x3c9320 315..316 'x' 0 children>
												<SyntaxNode_0x65f840 316..317 'p' 0 children>
												<SyntaxNode_0x6475b0 317..318 'r' 0 children>
												<SyntaxNode_0x3e94d0 318..319 'e' 0 children>
												<SyntaxNode_0x63ddc0 319..320 's' 0 children>
												<SyntaxNode_0x65daf0 320..321 's' 0 children>
												<SyntaxNode_0x61ba10 321..322 'i' 0 children>
												<SyntaxNode_0x6076d0 322..323 'o' 0 children>
												<SyntaxNode_0x6492a0 323..324 'n' 0 children>
											<SyntaxNode_0x60b210 324..325 ' ' 1 children>
												<SyntaxNode_0x3e30f0 324..325 ' ' 0 children>
							<SyntaxNode_0x644e20 325..345 'CLOSE\n              ' 1 children>
								<SyntaxNode_0x64d870 325..345 'CLOSE\n              ' 1 children>
									<SyntaxNode_0x667210 325..345 'CLOSE\n              ' 1 children>
										<SyntaxNode_0x6416c0 325..345 'CLOSE\n              ' 3 children>
											<SyntaxNode_0x666b40 325..326 'C' 0 children>
											<SyntaxNode_0x6015c0 326..330 'LOSE' 4 children>
												<SyntaxNode_0x3ee220 326..327 'L' 0 children>
												<SyntaxNode_0x6235f0 327..328 'O' 0 children>
												<SyntaxNode_0x63aa20 328..329 'S' 0 children>
												<SyntaxNode_0x6352a0 329..330 'E' 0 children>
											<SyntaxNode_0x650800 330..345 '\n              ' 15 children>
												<SyntaxNode_0x3d4820 330..331 '\n' 0 children>
												<SyntaxNode_0x3a0ab0 331..332 ' ' 0 children>
												<SyntaxNode_0x3f4840 332..333 ' ' 0 children>
												<SyntaxNode_0x3ef110 333..334 ' ' 0 children>
												<SyntaxNode_0x628490 334..335 ' ' 0 children>
												<SyntaxNode_0x3ede70 335..336 ' ' 0 children>
												<SyntaxNode_0x655e60 336..337 ' ' 0 children>
												<SyntaxNode_0x3fb340 337..338 ' ' 0 children>
												<SyntaxNode_0x39b5a0 338..339 ' ' 0 children>
												<SyntaxNode_0x615610 339..340 ' ' 0 children>
												<SyntaxNode_0x649b00 340..341 ' ' 0 children>
												<SyntaxNode_0x622640 341..342 ' ' 0 children>
												<SyntaxNode_0x3b1770 342..343 ' ' 0 children>
												<SyntaxNode_0x3a68e0 343..344 ' ' 0 children>
												<SyntaxNode_0x6427d0 344..345 ' ' 0 children>
					<SyntaxNode_0x645100 345..355 '/ Literal ' 2 children>
						<SyntaxNode_0x6593b0 345..347 '/ ' 2 children>
							<SyntaxNode_0x6676b0 345..346 '/' 0 children>
							<SyntaxNode_0x667af0 346..347 ' ' 1 children>
								<SyntaxNode_0x341470 346..347 ' ' 0 children>
						<SyntaxNode_0x3c7160 347..355 'Literal ' 1 children>
							<SyntaxNode_0x61f3c0 347..355 'Literal ' 1 children>
								<SyntaxNode_0x612480 347..355 'Literal ' 1 children>
									<SyntaxNode_0x657fd0 347..355 'Literal ' 1 children>
										<SyntaxNode_0x654560 347..355 'Literal ' 3 children>
											<SyntaxNode_0x3d34f0 347..348 'L' 0 children>
											<SyntaxNode_0x3b5410 348..354 'iteral' 6 children>
												<SyntaxNode_0x3d2e90 348..349 'i' 0 children>
												<SyntaxNode_0x656840 349..350 't' 0 children>
												<SyntaxNode_0x651800 350..351 'e' 0 children>
												<SyntaxNode_0x62f880 351..352 'r' 0 children>
												<SyntaxNode_0x64a940 352..353 'a' 0 children>
												<SyntaxNode_0x64ea30 353..354 'l' 0 children>
											<SyntaxNode_0x3e9140 354..355 ' ' 1 children>
												<SyntaxNode_0x659080 354..355 ' ' 0 children>
					<SyntaxNode_0x616820 355..363 '/ Class ' 2 children>
						<SyntaxNode_0x655de0 355..357 '/ ' 2 children>
							<SyntaxNode_0x661de0 355..356 '/' 0 children>
							<SyntaxNode_0x3dda40 356..357 ' ' 1 children>
								<SyntaxNode_0x3c2720 356..357 ' ' 0 children>
						<SyntaxNode_0x600ce0 357..363 'Class ' 1 children>
							<SyntaxNode_0x3c7ec0 357..363 'Class ' 1 children>
								<SyntaxNode_0x651c70 357..363 'Class ' 1 children>
									<SyntaxNode_0x6539d0 357..363 'Class ' 1 children>
										<SyntaxNode_0x61da40 357..363 'Class ' 3 children>
											<SyntaxNode_0x662330 357..358 'C' 0 children>
											<SyntaxNode_0x64ede0 358..362 'lass' 4 children>
												<SyntaxNode_0x62df10 358..359 'l' 0 children>
												<SyntaxNode_0x232390 359..360 'a' 0 children>
												<SyntaxNode_0x635320 360..361 's' 0 children>
												<SyntaxNode_0x663be0 361..362 's' 0 children>
											<SyntaxNode_0x64a3a0 362..363 ' ' 1 children>
												<SyntaxNode_0x648950 362..363 ' ' 0 children>
					<SyntaxNode_0x651380 363..387 '/ DOT\n\n# Lexical syntax\n' 2 children>
						<SyntaxNode_0x287df0 363..365 '/ ' 2 children>
							<SyntaxNode_0x61e210 363..364 '/' 0 children>
							<SyntaxNode_0x3bdc80 364..365 ' ' 1 children>
								<SyntaxNode_0x652100 364..365 ' ' 0 children>
						<SyntaxNode_0x665120 365..387 'DOT\n\n# Lexical syntax\n' 1 children>
							<SyntaxNode_0x6304f0 365..387 'DOT\n\n# Lexical syntax\n' 1 children>
								<SyntaxNode_0x65a880 365..387 'DOT\n\n# Lexical syntax\n' 1 children>
									<SyntaxNode_0x3e0c90 365..387 'DOT\n\n# Lexical syntax\n' 1 children>
										<SyntaxNode_0x3f21e0 365..387 'DOT\n\n# Lexical syntax\n' 3 children>
											<SyntaxNode_0x6133d0 365..366 'D' 0 children>
											<SyntaxNode_0x6689a0 366..368 'OT' 2 children>
												<SyntaxNode_0x648480 366..367 'O' 0 children>
												<SyntaxNode_0x655940 367..368 'T' 0 children>
											<SyntaxNode_0x6312e0 368..387 '\n\n# Lexical syntax\n' 3 children>
												<SyntaxNode_0x3f43f0 368..369 '\n' 0 children>
												<SyntaxNode_0x659040 369..370 '\n' 0 children>
												<SyntaxNode_0x641d90 370..387 '# Lexical syntax\n' 2 children>
													<SyntaxNode_0x641580 370..371 '#' 0 children>
													<SyntaxNode_0x668a20 386..387 '\n' 0 children>
		<SyntaxNode_0x60dff0 387..431 'Identifier <- IdentStart IdentCont* Spacing\n' 3 children>
			<SyntaxNode_0x3e28a0 387..398 'Identifier ' 3 children>
				<SyntaxNode_0x65aef0 387..388 'I' 0 children>
				<SyntaxNode_0x649fc0 388..397 'dentifier' 9 children>
					<SyntaxNode_0x648850 388..389 'd' 0 children>
					<SyntaxNode_0x6360d0 389..390 'e' 0 children>
					<SyntaxNode_0x3cebf0 390..391 'n' 0 children>
					<SyntaxNode_0x661390 391..392 't' 0 children>
					<SyntaxNode_0x65dde0 392..393 'i' 0 children>
					<SyntaxNode_0x6369b0 393..394 'f' 0 children>
					<SyntaxNode_0x3cdf30 394..395 'i' 0 children>
					<SyntaxNode_0x601f00 395..396 'e' 0 children>
					<SyntaxNode_0x3a9650 396..397 'r' 0 children>
				<SyntaxNode_0x6211c0 397..398 ' ' 1 children>
					<SyntaxNode_0x62f5c0 397..398 ' ' 0 children>
			<SyntaxNode_0x650a60 398..401 '<- ' 2 children>
				<SyntaxNode_0x661910 398..400 '<-' 0 children>
				<SyntaxNode_0x65eed0 400..401 ' ' 1 children>
					<SyntaxNode_0x63b350 400..401 ' ' 0 children>
			<SyntaxNode_0x3e3210 401..431 'IdentStart IdentCont* Spacing\n' 1 children>
				<SyntaxNode_0x64a7b0 401..431 'IdentStart IdentCont* Spacing\n' 3 children>
					<SyntaxNode_0x3f1b80 401..412 'IdentStart ' 1 children>
						<SyntaxNode_0x651c00 401..412 'IdentStart ' 1 children>
							<SyntaxNode_0x66a4c0 401..412 'IdentStart ' 1 children>
								<SyntaxNode_0x645df0 401..412 'IdentStart ' 3 children>
									<SyntaxNode_0x661910 401..402 'I' 0 children>
									<SyntaxNode_0x65c4b0 402..411 'dentStart' 9 children>
										<SyntaxNode_0x3e67f0 402..403 'd' 0 children>
										<SyntaxNode_0x3bff30 403..404 'e' 0 children>
										<SyntaxNode_0x64cc60 404..405 'n' 0 children>
										<SyntaxNode_0x62eba0 405..406 't' 0 children>
										<SyntaxNode_0x3bab20 406..407 'S' 0 children>
										<SyntaxNode_0x3ccd10 407..408 't' 0 children>
										<SyntaxNode_0x64eba0 408..409 'a' 0 children>
										<SyntaxNode_0x3ec7f0 409..410 'r' 0 children>
										<SyntaxNode_0x63d470 410..411 't' 0 children>
									<SyntaxNode_0x644d80 411..412 ' ' 1 children>
										<SyntaxNode_0x669960 411..412 ' ' 0 children>
					<SyntaxNode_0x65fc30 412..423 'IdentCont* ' 1 children>
						<SyntaxNode_0x65aa00 412..423 'IdentCont* ' 2 children>
							<SyntaxNode_0x3dbd70 412..421 'IdentCont' 1 children>
								<SyntaxNode_0x603e60 412..421 'IdentCont' 2 children>
									<SyntaxNode_0x37b1b0 412..413 'I' 0 children>
									<SyntaxNode_0x655e90 413..421 'dentCont' 8 children>
										<SyntaxNode_0x64ece0 413..414 'd' 0 children>
										<SyntaxNode_0x644b80 414..415 'e' 0 children>
										<SyntaxNode_0x65ae50 415..416 'n' 0 children>
										<SyntaxNode_0x6641f0 416..417 't' 0 children>
										<SyntaxNode_0x3cfaa0 417..418 'C' 0 children>
										<SyntaxNode_0x60a4d0 418..419 'o' 0 children>
										<SyntaxNode_0x650ec0 419..420 'n' 0 children>
										<SyntaxNode_0x641390 420..421 't' 0 children>
							<SyntaxNode_0x658950 421..423 '* ' 2 children>
								<SyntaxNode_0x663150 421..422 '*' 0 children>
								<SyntaxNode_0x3aa810 422..423 ' ' 1 children>
									<SyntaxNode_0x65adf0 422..423 ' ' 0 children>
					<SyntaxNode_0x3b03f0 423..431 'Spacing\n' 1 children>
						<SyntaxNode_0x3fb3a0 423..431 'Spacing\n' 1 children>
							<SyntaxNode_0x3d0a00 423..431 'Spacing\n' 1 children>
								<SyntaxNode_0x660420 423..431 'Spacing\n' 3 children>
									<SyntaxNode_0x649dc0 423..424 'S' 0 children>
									<SyntaxNode_0x624310 424..430 'pacing' 6 children>
										<SyntaxNode_0x3b0230 424..425 'p' 0 children>
										<SyntaxNode_0x643a90 425..426 'a' 0 children>
										<SyntaxNode_0x608940 426..427 'c' 0 children>
										<SyntaxNode_0x650e60 427..428 'i' 0 children>
										<SyntaxNode_0x61a680 428..429 'n' 0 children>
										<SyntaxNode_0x668540 429..430 'g' 0 children>
									<SyntaxNode_0x647940 430..431 '\n' 1 children>
										<SyntaxNode_0x3b9980 430..431 '\n' 0 children>
		<SyntaxNode_0x65b580 431..455 'IdentStart <- [a-zA-Z_]\n' 3 children>
			<SyntaxNode_0x651300 431..442 'IdentStart ' 3 children>
				<SyntaxNode_0x636f50 431..432 'I' 0 children>
				<SyntaxNode_0x64d0a0 432..441 'dentStart' 9 children>
					<SyntaxNode_0x663f70 432..433 'd' 0 children>
					<SyntaxNode_0x6676d0 433..434 'e' 0 children>
					<SyntaxNode_0x662f60 434..435 'n' 0 children>
					<SyntaxNode_0x3af7c0 435..436 't' 0 children>
					<SyntaxNode_0x3a9ff0 436..437 'S' 0 children>
					<SyntaxNode_0x3ca0a0 437..438 't' 0 children>
					<SyntaxNode_0x65ccc0 438..439 'a' 0 children>
					<SyntaxNode_0x654b10 439..440 'r' 0 children>
					<SyntaxNode_0x663bb0 440..441 't' 0 children>
				<SyntaxNode_0x61f0c0 441..442 ' ' 1 children>
					<SyntaxNode_0x658920 441..442 ' ' 0 children>
			<SyntaxNode_0x2f6b70 442..445 '<- ' 2 children>
				<SyntaxNode_0x652da0 442..444 '<-' 0 children>
				<SyntaxNode_0x63ec50 444..445 ' ' 1 children>
					<SyntaxNode_0x625b60 444..445 ' ' 0 children>
			<SyntaxNode_0x63c490 445..455 '[a-zA-Z_]\n' 1 children>
				<SyntaxNode_0x64f9b0 445..455 '[a-zA-Z_]\n' 1 children>
					<SyntaxNode_0x637190 445..455 '[a-zA-Z_]\n' 1 children>
						<SyntaxNode_0x622c20 445..455 '[a-zA-Z_]\n' 1 children>
							<SyntaxNode_0x62b9e0 445..455 '[a-zA-Z_]\n' 4 children>
								<SyntaxNode_0x602250 445..446 '[' 0 children>
								<SyntaxNode_0x622f90 446..453 'a-zA-Z_' 3 children>
									<SyntaxNode_0x6354f0 446..449 'a-z' 1 children>
										<SyntaxNode_0x3ac0a0 446..449 'a-z' 3 children>
											<SyntaxNode_0x64d4a0 446..447 'a' 1 children>
												<SyntaxNode_0x62ebd0 446..447 'a' 0 children>
											<SyntaxNode_0x3daf60 447..448 '-' 0 children>
											<SyntaxNode_0x665dc0 448..449 'z' 1 children>
												<SyntaxNode_0x6011a0 448..449 'z' 0 children>
									<SyntaxNode_0x3a6430 449..452 'A-Z' 1 children>
										<SyntaxNode_0x62a3f0 449..452 'A-Z' 3 children>
											<SyntaxNode_0x6449a0 449..450 'A' 1 children>
												<SyntaxNode_0x65fcf0 449..450 'A' 0 children>
											<SyntaxNode_0x3fa3b0 450..451 '-' 0 children>
											<SyntaxNode_0x3e84c0 451..452 'Z' 1 children>
												<SyntaxNode_0x609310 451..452 'Z' 0 children>
									<SyntaxNode_0x659b50 452..453 '_' 1 children>
										<SyntaxNode_0x64d850 452..453 '_' 1 children>
											<SyntaxNode_0x656240 452..453 '_' 0 children>
								<SyntaxNode_0x63d180 453..454 ']' 0 children>
								<SyntaxNode_0x394230 454..455 '\n' 1 children>
									<SyntaxNode_0x3b69c0 454..455 '\n' 0 children>
		<SyntaxNode_0x616980 455..488 'IdentCont  <- IdentStart / [0-9]\n' 3 children>
			<SyntaxNode_0x62ecb0 455..466 'IdentCont  ' 3 children>
				<SyntaxNode_0x3e0240 455..456 'I' 0 children>
				<SyntaxNode_0x3e06f0 456..464 'dentCont' 8 children>
					<SyntaxNode_0x656a10 456..457 'd' 0 children>
					<SyntaxNode_0x647de0 457..458 'e' 0 children>
					<SyntaxNode_0x63efb0 458..459 'n' 0 children>
					<SyntaxNode_0x65c700 459..460 't' 0 children>
					<SyntaxNode_0x385320 460..461 'C' 0 children>
					<SyntaxNode_0x341ad0 461..462 'o' 0 children>
					<SyntaxNode_0x3ea0c0 462..463 'n' 0 children>
					<SyntaxNode_0x606cf0 463..464 't' 0 children>
				<SyntaxNode_0x60e930 464..466 '  ' 2 children>
					<SyntaxNode_0x658320 464..465 ' ' 0 children>
					<SyntaxNode_0x63c780 465..466 ' ' 0 children>
			<SyntaxNode_0x65d440 466..469 '<- ' 2 children>
				<SyntaxNode_0x658cb0 466..468 '<-' 0 children>
				<SyntaxNode_0x62b450 468..469 ' ' 1 children>
					<SyntaxNode_0x62e020 468..469 ' ' 0 children>
			<SyntaxNode_0x613650 469..488 'IdentStart / [0-9]\n' 2 children>
				<SyntaxNode_0x3b4b60 469..480 'IdentStart ' 1 children>
					<SyntaxNode_0x658720 469..480 'IdentStart ' 1 children>
						<SyntaxNode_0x621130 469..480 'IdentStart ' 1 children>
							<SyntaxNode_0x668e10 469..480 'IdentStart ' 1 children>
								<SyntaxNode_0x62bd40 469..480 'IdentStart ' 3 children>
									<SyntaxNode_0x649c00 469..470 'I' 0 children>
									<SyntaxNode_0x3fad10 470..479 'dentStart' 9 children>
										<SyntaxNode_0x620fc0 470..471 'd' 0 children>
										<SyntaxNode_0x615f40 471..472 'e' 0 children>
										<SyntaxNode_0x3f8170 472..473 'n' 0 children>
										<SyntaxNode_0x6485e0 473..474 't' 0 children>
										<SyntaxNode_0x65e500 474..475 'S' 0 children>
										<SyntaxNode_0x62e670 475..476 't' 0 children>
										<SyntaxNode_0x3ba170 476..477 'a' 0 children>
										<SyntaxNode_0x3ae880 477..478 'r' 0 children>
										<SyntaxNode_0x645790 478..479 't' 0 children>
									<SyntaxNode_0x657930 479..480 ' ' 1 children>
										<SyntaxNode_0x6352a0 479..480 ' ' 0 children>
				<SyntaxNode_0x399260 480..488 '/ [0-9]\n' 1 children>
					<SyntaxNode_0x65b610 480..488 '/ [0-9]\n' 2 children>
						<SyntaxNode_0x3b6820 480..482 '/ ' 2 children>
							<SyntaxNode_0x3f6c20 480..481 '/' 0 children>
							<SyntaxNode_0x643a10 481..482 ' ' 1 children>
								<SyntaxNode_0x667370 481..482 ' ' 0 children>
						<SyntaxNode_0x61d640 482..488 '[0-9]\n' 1 children>
							<SyntaxNode_0x62b300 482..488 '[0-9]\n' 1 children>
								<SyntaxNode_0x65f740 482..488 '[0-9]\n' 1 children>
									<SyntaxNode_0x658f70 482..488 '[0-9]\n' 4 children>
										<SyntaxNode_0x3dc320 482..483 '[' 0 children>
										<SyntaxNode_0x3d76a0 483..486 '0-9' 1 children>
											<SyntaxNode_0x631220 483..486 '0-9' 1 children>
												<SyntaxNode_0x6533f0 483..486 '0-9' 3 children>
													<SyntaxNode_0x6100d0 483..484 '0' 1 children>
														<SyntaxNode_0x61c860 483..484 '0' 0 children>
													<SyntaxNode_0x25a5a0 484..485 '-' 0 children>
													<SyntaxNode_0x3e21b0 485..486 '9' 1 children>
														<SyntaxNode_0x3ec1d0 485..486 '9' 0 children>
										<SyntaxNode_0x64fbb0 486..487 ']' 0 children>
										<SyntaxNode_0x668540 487..488 '\n' 1 children>
											<SyntaxNode_0x655bf0 487..488 '\n' 0 children>
		<SyntaxNode_0x3b5410 488..577 'Literal    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\n' 3 children>
			<SyntaxNode_0x637ca0 488..499 'Literal    ' 3 children>
				<SyntaxNode_0x3c5cb0 488..489 'L' 0 children>
				<SyntaxNode_0x6546c0 489..495 'iteral' 6 children>
					<SyntaxNode_0x65bf10 489..490 'i' 0 children>
					<SyntaxNode_0x654320 490..491 't' 0 children>
					<SyntaxNode_0x3f4920 491..492 'e' 0 children>
					<SyntaxNode_0x6682f0 492..493 'r' 0 children>
					<SyntaxNode_0x6357b0 493..494 'a' 0 children>
					<SyntaxNode_0x3e9110 494..495 'l' 0 children>
				<SyntaxNode_0x6457f0 495..499 '    ' 4 children>
					<SyntaxNode_0x63f660 495..496 ' ' 0 children>
					<SyntaxNode_0x62bc00 496..497 ' ' 0 children>
					<SyntaxNode_0x658510 497..498 ' ' 0 children>
					<SyntaxNode_0x65ee40 498..499 ' ' 0 children>
			<SyntaxNode_0x6545a0 499..502 '<- ' 2 children>
				<SyntaxNode_0x656c50 499..501 '<-' 0 children>
				<SyntaxNode_0x3cc6d0 501..502 ' ' 1 children>
					<SyntaxNode_0x3dfc80 501..502 ' ' 0 children>
			<SyntaxNode_0x3db4d0 502..577 '['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\n' 2 children>
				<SyntaxNode_0x64dbd0 502..545 '['] (!['] Char)* ['] Spacing\n              ' 4 children>
					<SyntaxNode_0x639970 502..506 '['] ' 1 children>
						<SyntaxNode_0x3ec1d0 502..506 '['] ' 1 children>
							<SyntaxNode_0x63cca0 502..506 '['] ' 4 children>
								<SyntaxNode_0x6303f0 502..503 '[' 0 children>
								<SyntaxNode_0x658a60 503..504 ''' 1 children>
									<SyntaxNode_0x64f0b0 503..504 ''' 1 children>
										<SyntaxNode_0x64d540 503..504 ''' 1 children>
											<SyntaxNode_0x3d0970 503..504 ''' 0 children>
								<SyntaxNode_0x607cf0 504..505 ']' 0 children>
								<SyntaxNode_0x3e73f0 505..506 ' ' 1 children>
									<SyntaxNode_0x669980 505..506 ' ' 0 children>
					<SyntaxNode_0x661b20 506..519 '(!['] Char)* ' 1 children>
						<SyntaxNode_0x63b6c0 506..519 '(!['] Char)* ' 2 children>
							<SyntaxNode_0x627c70 506..517 '(!['] Char)' 3 children>
								<SyntaxNode_0x61a230 506..507 '(' 1 children>
									<SyntaxNode_0x3c9970 506..507 '(' 0 children>
								<SyntaxNode_0x654b10 507..516 '!['] Char' 1 children>
									<SyntaxNode_0x618400 507..516 '!['] Char' 2 children>
										<SyntaxNode_0x62f130 507..512 '!['] ' 2 children>
											<SyntaxNode_0x6410a0 507..508 '!' 1 children>
												<SyntaxNode_0x60d9d0 507..508 '!' 0 children>
											<SyntaxNode_0x3b9980 508..512 '['] ' 1 children>
												<SyntaxNode_0x6388a0 508..512 '['] ' 4 children>
													<SyntaxNode_0x63e0f0 508..509 '[' 0 children>
													<SyntaxNode_0x654000 509..510 ''' 1 children>
														<SyntaxNode_0x645900 509..510 ''' 1 children>
															<SyntaxNode_0x617c10 509..510 ''' 1 children>
																<SyntaxNode_0x629430 509..510 ''' 0 children>
													<SyntaxNode_0x665be0 510..511 ']' 0 children>
													<SyntaxNode_0x641dc0 511..512 ' ' 1 children>
														<SyntaxNode_0x61b7e0 511..512 ' ' 0 children>
										<SyntaxNode_0x654c80 512..516 'Char' 1 children>
											<SyntaxNode_0x63bb80 512..516 'Char' 1 children>
												<SyntaxNode_0x3c4f60 512..516 'Char' 1 children>
													<SyntaxNode_0x62b600 512..516 'Char' 2 children>
														<SyntaxNode_0x3f5320 512..513 'C' 0 children>
														<SyntaxNode_0x64b360 513..516 'har' 3 children>
															<SyntaxNode_0x6552e0 513..514 'h' 0 children>
															<SyntaxNode_0x3417d0 514..515 'a' 0 children>
															<SyntaxNode_0x626760 515..516 'r' 0 children>
								<SyntaxNode_0x6285d0 516..517 ')' 1 children>
									<SyntaxNode_0x39c6f0 516..517 ')' 0 children>
							<SyntaxNode_0x629a50 517..519 '* ' 2 children>
								<SyntaxNode_0x667010 517..518 '*' 0 children>
								<SyntaxNode_0x632410 518..519 ' ' 1 children>
									<SyntaxNode_0x61fdf0 518..519 ' ' 0 children>
					<SyntaxNode_0x62a5c0 519..523 '['] ' 1 children>
						<SyntaxNode_0x612590 519..523 '['] ' 1 children>
							<SyntaxNode_0x64b840 519..523 '['] ' 4 children>
								<SyntaxNode_0x64ead0 519..520 '[' 0 children>
								<SyntaxNode_0x650f60 520..521 ''' 1 children>
									<SyntaxNode_0x634b70 520..521 ''' 1 children>
										<SyntaxNode_0x3ebbb0 520..521 ''' 1 children>
											<SyntaxNode_0x62ef40 520..521 ''' 0 children>
								<SyntaxNode_0x619fb0 521..522 ']' 0 children>
								<SyntaxNode_0x6451c0 522..523 ' ' 1 children>
									<SyntaxNode_0x66aab0 522..523 ' ' 0 children>
					<SyntaxNode_0x65bba0 523..545 'Spacing\n              ' 1 children>
						<SyntaxNode_0x64a1d0 523..545 'Spacing\n              ' 1 children>
							<SyntaxNode_0x62e7f0 523..545 'Spacing\n              ' 1 children>
								<SyntaxNode_0x3ebb50 523..545 'Spacing\n              ' 3 children>
									<SyntaxNode_0x64c2f0 523..524 'S' 0 children>
									<SyntaxNode_0x650e60 524..530 'pacing' 6 children>
										<SyntaxNode_0x630690 524..525 'p' 0 children>
										<SyntaxNode_0x3abb00 525..526 'a' 0 children>
										<SyntaxNode_0x64f530 526..527 'c' 0 children>
										<SyntaxNode_0x3f1290 527..528 'i' 0 children>
										<SyntaxNode_0x3ab9d0 528..529 'n' 0 children>
										<SyntaxNode_0x661440 529..530 'g' 0 children>
									<SyntaxNode_0x64bd30 530..545 '\n              ' 15 children>
										<SyntaxNode_0x6575d0 530..531 '\n' 0 children>
										<SyntaxNode_0x601230 531..532 ' ' 0 children>
										<SyntaxNode_0x3c7380 532..533 ' ' 0 children>
										<SyntaxNode_0x3cc590 533..534 ' ' 0 children>
										<SyntaxNode_0x6049a0 534..535 ' ' 0 children>
										<SyntaxNode_0x3a2c80 535..536 ' ' 0 children>
										<SyntaxNode_0x657910 536..537 ' ' 0 children>
										<SyntaxNode_0x63d2e0 537..538 ' ' 0 children>
										<SyntaxNode_0x64e370 538..539 ' ' 0 children>
										<SyntaxNode_0x3cbbb0 539..540 ' ' 0 children>
										<SyntaxNode_0x656cd0 540..541 ' ' 0 children>
										<SyntaxNode_0x669ca0 541..542 ' ' 0 children>
										<SyntaxNode_0x3e36c0 542..543 ' ' 0 children>
										<SyntaxNode_0x653390 543..544 ' ' 0 children>
										<SyntaxNode_0x6674c0 544..545 ' ' 0 children>
				<SyntaxNode_0x65a1a0 545..577 '/ [\"] (![\"] Char)* [\"] Spacing\n\n' 1 children>
					<SyntaxNode_0x3aa220 545..577 '/ [\"] (![\"] Char)* [\"] Spacing\n\n' 2 children>
						<SyntaxNode_0x3f4d70 545..547 '/ ' 2 children>
							<SyntaxNode_0x614560 545..546 '/' 0 children>
							<SyntaxNode_0x6143b0 546..547 ' ' 1 children>
								<SyntaxNode_0x64a5d0 546..547 ' ' 0 children>
						<SyntaxNode_0x63a930 547..577 '[\"] (![\"] Char)* [\"] Spacing\n\n' 4 children>
							<SyntaxNode_0x63f000 547..551 '[\"] ' 1 children>
								<SyntaxNode_0x667c50 547..551 '[\"] ' 1 children>
									<SyntaxNode_0x601350 547..551 '[\"] ' 4 children>
										<SyntaxNode_0x315f90 547..548 '[' 0 children>
										<SyntaxNode_0x3eee20 548..549 '\"' 1 children>
											<SyntaxNode_0x626690 548..549 '\"' 1 children>
												<SyntaxNode_0x644b80 548..549 '\"' 1 children>
													<SyntaxNode_0x3a45f0 548..549 '\"' 0 children>
										<SyntaxNode_0x3f7400 549..550 ']' 0 children>
										<SyntaxNode_0x62aad0 550..551 ' ' 1 children>
											<SyntaxNode_0x63d1e0 550..551 ' ' 0 children>
							<SyntaxNode_0x6187f0 551..564 '(![\"] Char)* ' 1 children>
								<SyntaxNode_0x661fd0 551..564 '(![\"] Char)* ' 2 children>
									<SyntaxNode_0x6567f0 551..562 '(![\"] Char)' 3 children>
										<SyntaxNode_0x604620 551..552 '(' 1 children>
											<SyntaxNode_0x61f240 551..552 '(' 0 children>
										<SyntaxNode_0x63dbc0 552..561 '![\"] Char' 1 children>
											<SyntaxNode_0x663fe0 552..561 '![\"] Char' 2 children>
												<SyntaxNode_0x65c990 552..557 '![\"] ' 2 children>
													<SyntaxNode_0x63fb20 552..553 '!' 1 children>
														<SyntaxNode_0x649560 552..553 '!' 0 children>
													<SyntaxNode_0x60aab0 553..557 '[\"] ' 1 children>
														<SyntaxNode_0x62eaf0 553..557 '[\"] ' 4 children>
															<SyntaxNode_0x651c70 553..554 '[' 0 children>
															<SyntaxNode_0x65edf0 554..555 '\"' 1 children>
																<SyntaxNode_0x661d40 554..555 '\"' 1 children>
																	<SyntaxNode_0x65f250 554..555 '\"' 1 children>
																		<SyntaxNode_0x3e59c0 554..555 '\"' 0 children>
															<SyntaxNode_0x62f320 555..556 ']' 0 children>
															<SyntaxNode_0x659a50 556..557 ' ' 1 children>
																<SyntaxNode_0x65e300 556..557 ' ' 0 children>
												<SyntaxNode_0x63ffe0 557..561 'Char' 1 children>
													<SyntaxNode_0x3fb9b0 557..561 'Char' 1 children>
														<SyntaxNode_0x633720 557..561 'Char' 1 children>
															<SyntaxNode_0x658f20 557..561 'Char' 2 children>
																<SyntaxNode_0x62fbd0 557..558 'C' 0 children>
																<SyntaxNode_0x667c60 558..561 'har' 3 children>
																	<SyntaxNode_0x3a48d0 558..559 'h' 0 children>
																	<SyntaxNode_0x62adf0 559..560 'a' 0 children>
																	<SyntaxNode_0x65bc70 560..561 'r' 0 children>
										<SyntaxNode_0x65e500 561..562 ')' 1 children>
											<SyntaxNode_0x65bbb0 561..562 ')' 0 children>
									<SyntaxNode_0x3c3a50 562..564 '* ' 2 children>
										<SyntaxNode_0x38f680 562..563 '*' 0 children>
										<SyntaxNode_0x630e40 563..564 ' ' 1 children>
											<SyntaxNode_0x61f8c0 563..564 ' ' 0 children>
							<SyntaxNode_0x630400 564..568 '[\"] ' 1 children>
								<SyntaxNode_0x6608e0 564..568 '[\"] ' 1 children>
									<SyntaxNode_0x662780 564..568 '[\"] ' 4 children>
										<SyntaxNode_0x631920 564..565 '[' 0 children>
										<SyntaxNode_0x627660 565..566 '\"' 1 children>
											<SyntaxNode_0x3eeb20 565..566 '\"' 1 children>
												<SyntaxNode_0x63ebd0 565..566 '\"' 1 children>
													<SyntaxNode_0x64e840 565..566 '\"' 0 children>
										<SyntaxNode_0x612730 566..567 ']' 0 children>
										<SyntaxNode_0x6101f0 567..568 ' ' 1 children>
											<SyntaxNode_0x3f4c40 567..568 ' ' 0 children>
							<SyntaxNode_0x623bb0 568..577 'Spacing\n\n' 1 children>
								<SyntaxNode_0x3cc7c0 568..577 'Spacing\n\n' 1 children>
									<SyntaxNode_0x621ce0 568..577 'Spacing\n\n' 1 children>
										<SyntaxNode_0x60b580 568..577 'Spacing\n\n' 3 children>
											<SyntaxNode_0x656560 568..569 'S' 0 children>
											<SyntaxNode_0x60e4d0 569..575 'pacing' 6 children>
												<SyntaxNode_0x2c08b0 569..570 'p' 0 children>
												<SyntaxNode_0x663fe0 570..571 'a' 0 children>
												<SyntaxNode_0x648800 571..572 'c' 0 children>
												<SyntaxNode_0x64dcd0 572..573 'i' 0 children>
												<SyntaxNode_0x65ebd0 573..574 'n' 0 children>
												<SyntaxNode_0x62e0f0 574..575 'g' 0 children>
											<SyntaxNode_0x6057e0 575..577 '\n\n' 2 children>
												<SyntaxNode_0x642a90 575..576 '\n' 0 children>
												<SyntaxNode_0x65a6c0 576..577 '\n' 0 children>
		<SyntaxNode_0x667e30 577..621 'Class      <- '[' (!']' Range)* ']' Spacing\n' 3 children>
			<SyntaxNode_0x64b110 577..588 'Class      ' 3 children>
				<SyntaxNode_0x658430 577..578 'C' 0 children>
				<SyntaxNode_0x3b10b0 578..582 'lass' 4 children>
					<SyntaxNode_0x3f1580 578..579 'l' 0 children>
					<SyntaxNode_0x60cf00 579..580 'a' 0 children>
					<SyntaxNode_0x6388a0 580..581 's' 0 children>
					<SyntaxNode_0x6278c0 581..582 's' 0 children>
				<SyntaxNode_0x64b5f0 582..588 '      ' 6 children>
					<SyntaxNode_0x663810 582..583 ' ' 0 children>
					<SyntaxNode_0x65fd50 583..584 ' ' 0 children>
					<SyntaxNode_0x65cf20 584..585 ' ' 0 children>
					<SyntaxNode_0x65adf0 585..586 ' ' 0 children>
					<SyntaxNode_0x604780 586..587 ' ' 0 children>
					<SyntaxNode_0x603e60 587..588 ' ' 0 children>
			<SyntaxNode_0x3c2ab0 588..591 '<- ' 2 children>
				<SyntaxNode_0x622160 588..590 '<-' 0 children>
				<SyntaxNode_0x65abd0 590..591 ' ' 1 children>
					<SyntaxNode_0x65ee20 590..591 ' ' 0 children>
			<SyntaxNode_0x641670 591..621 ''[' (!']' Range)* ']' Spacing\n' 1 children>
				<SyntaxNode_0x3f7980 591..621 ''[' (!']' Range)* ']' Spacing\n' 4 children>
					<SyntaxNode_0x6604e0 591..595 ''[' ' 1 children>
						<SyntaxNode_0x6472d0 591..595 ''[' ' 1 children>
							<SyntaxNode_0x2e5a40 591..595 ''[' ' 4 children>
								<SyntaxNode_0x6085f0 591..592 ''' 0 children>
								<SyntaxNode_0x65b790 592..593 '[' 1 children>
									<SyntaxNode_0x6627d0 592..593 '[' 1 children>
										<SyntaxNode_0x63b970 592..593 '[' 1 children>
											<SyntaxNode_0x395590 592..593 '[' 0 children>
								<SyntaxNode_0x3f6950 593..594 ''' 0 children>
								<SyntaxNode_0x647eb0 594..595 ' ' 1 children>
									<SyntaxNode_0x601560 594..595 ' ' 0 children>
					<SyntaxNode_0x616d20 595..609 '(!']' Range)* ' 1 children>
						<SyntaxNode_0x665a10 595..609 '(!']' Range)* ' 2 children>
							<SyntaxNode_0x62e530 595..607 '(!']' Range)' 3 children>
								<SyntaxNode_0x6657c0 595..596 '(' 1 children>
									<SyntaxNode_0x668580 595..596 '(' 0 children>
								<SyntaxNode_0x3c4640 596..606 '!']' Range' 1 children>
									<SyntaxNode_0x6003f0 596..606 '!']' Range' 2 children>
										<SyntaxNode_0x6584d0 596..601 '!']' ' 2 children>
											<SyntaxNode_0x3e36c0 596..597 '!' 1 children>
												<SyntaxNode_0x61ee00 596..597 '!' 0 children>
											<SyntaxNode_0x62ca60 597..601 '']' ' 1 children>
												<SyntaxNode_0x6653c0 597..601 '']' ' 4 children>
													<SyntaxNode_0x617ee0 597..598 ''' 0 children>
													<SyntaxNode_0x640ff0 598..599 ']' 1 children>
														<SyntaxNode_0x621df0 598..599 ']' 1 children>
															<SyntaxNode_0x65a500 598..599 ']' 1 children>
																<SyntaxNode_0x658bb0 598..599 ']' 0 children>
													<SyntaxNode_0x619070 599..600 ''' 0 children>
													<SyntaxNode_0x3bec90 600..601 ' ' 1 children>
														<SyntaxNode_0x669a60 600..601 ' ' 0 children>
										<SyntaxNode_0x63aec0 601..606 'Range' 1 children>
											<SyntaxNode_0x66aae0 601..606 'Range' 1 children>
												<SyntaxNode_0x667020 601..606 'Range' 1 children>
													<SyntaxNode_0x65c580 601..606 'Range' 2 children>
														<SyntaxNode_0x607430 601..602 'R' 0 children>
														<SyntaxNode_0x657de0 602..606 'ange' 4 children>
															<SyntaxNode_0x632a40 602..603 'a' 0 children>
															<SyntaxNode_0x66a740 603..604 'n' 0 children>
															<SyntaxNode_0x65a0c0 604..605 'g' 0 children>
															<SyntaxNode_0x6331f0 605..606 'e' 0 children>
								<SyntaxNode_0x658810 606..607 ')' 1 children>
									<SyntaxNode_0x617530 606..607 ')' 0 children>
							<SyntaxNode_0x64dcd0 607..609 '* ' 2 children>
								<SyntaxNode_0x661340 607..608 '*' 0 children>
								<SyntaxNode_0x65a9b0 608..609 ' ' 1 children>
									<SyntaxNode_0x3c4f00 608..609 ' ' 0 children>
					<SyntaxNode_0x62b130 609..613 '']' ' 1 children>
						<SyntaxNode_0x63a1b0 609..613 '']' ' 1 children>
							<SyntaxNode_0x65bb00 609..613 '']' ' 4 children>
								<SyntaxNode_0x642890 609..610 ''' 0 children>
								<SyntaxNode_0x635d60 610..611 ']' 1 children>
									<SyntaxNode_0x657830 610..611 ']' 1 children>
										<SyntaxNode_0x6610e0 610..611 ']' 1 children>
											<SyntaxNode_0x622760 610..611 ']' 0 children>
								<SyntaxNode_0x3660c0 611..612 ''' 0 children>
								<SyntaxNode_0x646430 612..613 ' ' 1 children>
									<SyntaxNode_0x649a70 612..613 ' ' 0 children>
					<SyntaxNode_0x64a080 613..621 'Spacing\n' 1 children>
						<SyntaxNode_0x3a0de0 613..621 'Spacing\n' 1 children>
							<SyntaxNode_0x658420 613..621 'Spacing\n' 1 children>
								<SyntaxNode_0x3d7d40 613..621 'Spacing\n' 3 children>
									<SyntaxNode_0x3b3fb0 613..614 'S' 0 children>
									<SyntaxNode_0x649870 614..620 'pacing' 6 children>
										<SyntaxNode_0x63e340 614..615 'p' 0 children>
										<SyntaxNode_0x63a830 615..616 'a' 0 children>
										<SyntaxNode_0x665f70 616..617 'c' 0 children>
										<SyntaxNode_0x645e90 617..618 'i' 0 children>
										<SyntaxNode_0x619070 618..619 'n' 0 children>
										<SyntaxNode_0x6033c0 619..620 'g' 0 children>
									<SyntaxNode_0x63ce80 620..621 '\n' 1 children>
										<SyntaxNode_0x654b70 620..621 '\n' 0 children>
		<SyntaxNode_0x3e0d20 621..656 'Range      <- Char '-' Char / Char\n' 3 children>
			<SyntaxNode_0x3baaa0 621..632 'Range      ' 3 children>
				<SyntaxNode_0x669a10 621..622 'R' 0 children>
				<SyntaxNode_0x3d6fb0 622..626 'ange' 4 children>
					<SyntaxNode_0x3b9640 622..623 'a' 0 children>
					<SyntaxNode_0x659610 623..624 'n' 0 children>
					<SyntaxNode_0x630ea0 624..625 'g' 0 children>
					<SyntaxNode_0x665530 625..626 'e' 0 children>
				<SyntaxNode_0x6405b0 626..632 '      ' 6 children>
					<SyntaxNode_0x634610 626..627 ' ' 0 children>
					<SyntaxNode_0x6524b0 627..628 ' ' 0 children>
					<SyntaxNode_0x3946e0 628..629 ' ' 0 children>
					<SyntaxNode_0x650800 629..630 ' ' 0 children>
					<SyntaxNode_0x39d550 630..631 ' ' 0 children>
					<SyntaxNode_0x610f80 631..632 ' ' 0 children>
			<SyntaxNode_0x659af0 632..635 '<- ' 2 children>
				<SyntaxNode_0x648bd0 632..634 '<-' 0 children>
				<SyntaxNode_0x638060 634..635 ' ' 1 children>
					<SyntaxNode_0x63dd80 634..635 ' ' 0 children>
			<SyntaxNode_0x64e370 635..656 'Char '-' Char / Char\n' 2 children>
				<SyntaxNode_0x649640 635..649 'Char '-' Char ' 3 children>
					<SyntaxNode_0x659230 635..640 'Char ' 1 children>
						<SyntaxNode_0x635aa0 635..640 'Char ' 1 children>
							<SyntaxNode_0x3b48d0 635..640 'Char ' 1 children>
								<SyntaxNode_0x3cc950 635..640 'Char ' 3 children>
									<SyntaxNode_0x3cd8d0 635..636 'C' 0 children>
									<SyntaxNode_0x65e710 636..639 'har' 3 children>
										<SyntaxNode_0x62b300 636..637 'h' 0 children>
										<SyntaxNode_0x652ac0 637..638 'a' 0 children>
										<SyntaxNode_0x3abe80 638..639 'r' 0 children>
									<SyntaxNode_0x62e9e0 639..640 ' ' 1 children>
										<SyntaxNode_0x658470 639..640 ' ' 0 children>
					<SyntaxNode_0x60afe0 640..644 ''-' ' 1 children>
						<SyntaxNode_0x65a690 640..644 ''-' ' 1 children>
							<SyntaxNode_0x644b80 640..644 ''-' ' 4 children>
								<SyntaxNode_0x3b8b80 640..641 ''' 0 children>
								<SyntaxNode_0x666b00 641..642 '-' 1 children>
									<SyntaxNode_0x6101f0 641..642 '-' 1 children>
										<SyntaxNode_0x629ee0 641..642 '-' 1 children>
											<SyntaxNode_0x3ec330 641..642 '-' 0 children>
								<SyntaxNode_0x65c990 642..643 ''' 0 children>
								<SyntaxNode_0x6366c0 643..644 ' ' 1 children>
									<SyntaxNode_0x6682d0 643..644 ' ' 0 children>
					<SyntaxNode_0x3fa6f0 644..649 'Char ' 1 children>
						<SyntaxNode_0x3c8400 644..649 'Char ' 1 children>
							<SyntaxNode_0x621210 644..649 'Char ' 1 children>
								<SyntaxNode_0x3f6db0 644..649 'Char ' 3 children>
									<SyntaxNode_0x3965d0 644..645 'C' 0 children>
									<SyntaxNode_0x630e00 645..648 'har' 3 children>
										<SyntaxNode_0x6352a0 645..646 'h' 0 children>
										<SyntaxNode_0x652ac0 646..647 'a' 0 children>
										<SyntaxNode_0x617820 647..648 'r' 0 children>
									<SyntaxNode_0x602ca0 648..649 ' ' 1 children>
										<SyntaxNode_0x3c5550 648..649 ' ' 0 children>
				<SyntaxNode_0x6159e0 649..656 '/ Char\n' 1 children>
					<SyntaxNode_0x648100 649..656 '/ Char\n' 2 children>
						<SyntaxNode_0x6352a0 649..651 '/ ' 2 children>
							<SyntaxNode_0x3f7170 649..650 '/' 0 children>
							<SyntaxNode_0x6589f0 650..651 ' ' 1 children>
								<SyntaxNode_0x654760 650..651 ' ' 0 children>
						<SyntaxNode_0x3dff20 651..656 'Char\n' 1 children>
							<SyntaxNode_0x6548b0 651..656 'Char\n' 1 children>
								<SyntaxNode_0x65bb00 651..656 'Char\n' 1 children>
									<SyntaxNode_0x63df30 651..656 'Char\n' 1 children>
										<SyntaxNode_0x632550 651..656 'Char\n' 3 children>
											<SyntaxNode_0x65f8f0 651..652 'C' 0 children>
											<SyntaxNode_0x63d240 652..655 'har' 3 children>
												<SyntaxNode_0x6319d0 652..653 'h' 0 children>
												<SyntaxNode_0x63bec0 653..654 'a' 0 children>
												<SyntaxNode_0x63d6b0 654..655 'r' 0 children>
											<SyntaxNode_0x65ad80 655..656 '\n' 1 children>
												<SyntaxNode_0x65bc00 655..656 '\n' 0 children>
		<SyntaxNode_0x616e00 656..786 'Char       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\n' 3 children>
			<SyntaxNode_0x645b60 656..667 'Char       ' 3 children>
				<SyntaxNode_0x3cafd0 656..657 'C' 0 children>
				<SyntaxNode_0x64d220 657..660 'har' 3 children>
					<SyntaxNode_0x63f3f0 657..658 'h' 0 children>
					<SyntaxNode_0x658e40 658..659 'a' 0 children>
					<SyntaxNode_0x629960 659..660 'r' 0 children>
				<SyntaxNode_0x650970 660..667 '       ' 7 children>
					<SyntaxNode_0x64c650 660..661 ' ' 0 children>
					<SyntaxNode_0x662ae0 661..662 ' ' 0 children>
					<SyntaxNode_0x397300 662..663 ' ' 0 children>
					<SyntaxNode_0x3ac940 663..664 ' ' 0 children>
					<SyntaxNode_0x64d6c0 664..665 ' ' 0 children>
					<SyntaxNode_0x61a730 665..666 ' ' 0 children>
					<SyntaxNode_0x3d0a00 666..667 ' ' 0 children>
			<SyntaxNode_0x656040 667..670 '<- ' 2 children>
				<SyntaxNode_0x65af80 667..669 '<-' 0 children>
				<SyntaxNode_0x63cdd0 669..670 ' ' 1 children>
					<SyntaxNode_0x658c60 669..670 ' ' 0 children>
			<SyntaxNode_0x3ea0c0 670..786 ''\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\n' 2 children>
				<SyntaxNode_0x604780 670..703 ''\\\\' [nrt'\"\\[\\]\\\\]\n              ' 2 children>
					<SyntaxNode_0x601920 670..675 ''\\\\' ' 1 children>
						<SyntaxNode_0x652800 670..675 ''\\\\' ' 1 children>
							<SyntaxNode_0x63e340 670..675 ''\\\\' ' 4 children>
								<SyntaxNode_0x655130 670..671 ''' 0 children>
								<SyntaxNode_0x661410 671..673 '\\\\' 1 children>
									<SyntaxNode_0x601220 671..673 '\\\\' 1 children>
										<SyntaxNode_0x3b1420 671..673 '\\\\' 2 children>
											<SyntaxNode_0x3dc460 671..672 '\\' 0 children>
											<SyntaxNode_0x62cd90 672..673 '\\' 0 children>
								<SyntaxNode_0x62b170 673..674 ''' 0 children>
								<SyntaxNode_0x6183d0 674..675 ' ' 1 children>
									<SyntaxNode_0x651180 674..675 ' ' 0 children>
					<SyntaxNode_0x657810 675..703 '[nrt'\"\\[\\]\\\\]\n              ' 1 children>
						<SyntaxNode_0x636be0 675..703 '[nrt'\"\\[\\]\\\\]\n              ' 1 children>
							<SyntaxNode_0x642d00 675..703 '[nrt'\"\\[\\]\\\\]\n              ' 4 children>
								<SyntaxNode_0x373610 675..676 '[' 0 children>
								<SyntaxNode_0x654790 676..687 'nrt'\"\\[\\]\\\\' 8 children>
									<SyntaxNode_0x64ec50 676..677 'n' 1 children>
										<SyntaxNode_0x65b860 676..677 'n' 1 children>
											<SyntaxNode_0x60ec30 676..677 'n' 0 children>
									<SyntaxNode_0x60db50 677..678 'r' 1 children>
										<SyntaxNode_0x3e81d0 677..678 'r' 1 children>
											<SyntaxNode_0x3b03f0 677..678 'r' 0 children>
									<SyntaxNode_0x654670 678..679 't' 1 children>
										<SyntaxNode_0x655130 678..679 't' 1 children>
											<SyntaxNode_0x64b4a0 678..679 't' 0 children>
									<SyntaxNode_0x6516a0 679..680 ''' 1 children>
										<SyntaxNode_0x648130 679..680 ''' 1 children>
											<SyntaxNode_0x64fd20 679..680 ''' 0 children>
									<SyntaxNode_0x621c60 680..681 '\"' 1 children>
										<SyntaxNode_0x6203b0 680..681 '\"' 1 children>
											<SyntaxNode_0x6634e0 680..681 '\"' 0 children>
									<SyntaxNode_0x64dda0 681..683 '\\[' 1 children>
										<SyntaxNode_0x60e320 681..683 '\\[' 2 children>
											<SyntaxNode_0x620000 681..682 '\\' 0 children>
											<SyntaxNode_0x646c40 682..683 '[' 0 children>
									<SyntaxNode_0x3110a0 683..685 '\\]' 1 children>
										<SyntaxNode_0x667d00 683..685 '\\]' 2 children>
											<SyntaxNode_0x6646e0 683..684 '\\' 0 children>
											<SyntaxNode_0x61c820 684..685 ']' 0 children>
									<SyntaxNode_0x3efac0 685..687 '\\\\' 1 children>
										<SyntaxNode_0x61fd20 685..687 '\\\\' 2 children>
											<SyntaxNode_0x3b4030 685..686 '\\' 0 children>
											<SyntaxNode_0x6465c0 686..687 '\\' 0 children>
								<SyntaxNode_0x63c7b0 687..688 ']' 0 children>
								<SyntaxNode_0x664430 688..703 '\n              ' 15 children>
									<SyntaxNode_0x651250 688..689 '\n' 0 children>
									<SyntaxNode_0x63e200 689..690 ' ' 0 children>
									<SyntaxNode_0x665500 690..691 ' ' 0 children>
									<SyntaxNode_0x6684b0 691..692 ' ' 0 children>
									<SyntaxNode_0x65e150 692..693 ' ' 0 children>
									<SyntaxNode_0x665820 693..694 ' ' 0 children>
									<SyntaxNode_0x666c50 694..695 ' ' 0 children>
									<SyntaxNode_0x657530 695..696 ' ' 0 children>
									<SyntaxNode_0x622bb0 696..697 ' ' 0 children>
									<SyntaxNode_0x3d2b00 697..698 ' ' 0 children>
									<SyntaxNode_0x62f740 698..699 ' ' 0 children>
									<SyntaxNode_0x6535b0 699..700 ' ' 0 children>
									<SyntaxNode_0x6155a0 700..701 ' ' 0 children>
									<SyntaxNode_0x65b4b0 701..702 ' ' 0 children>
									<SyntaxNode_0x662a30 702..703 ' ' 0 children>
				<SyntaxNode_0x3d0840 703..786 '/ '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\n' 3 children>
					<SyntaxNode_0x39fd80 703..742 '/ '\\\\' [0-2] [0-7] [0-7]\n              ' 2 children>
						<SyntaxNode_0x652610 703..705 '/ ' 2 children>
							<SyntaxNode_0x613310 703..704 '/' 0 children>
							<SyntaxNode_0x6639a0 704..705 ' ' 1 children>
								<SyntaxNode_0x63c7c0 704..705 ' ' 0 children>
						<SyntaxNode_0x62dfc0 705..742 ''\\\\' [0-2] [0-7] [0-7]\n              ' 4 children>
							<SyntaxNode_0x624320 705..710 ''\\\\' ' 1 children>
								<SyntaxNode_0x655e60 705..710 ''\\\\' ' 1 children>
									<SyntaxNode_0x3dc460 705..710 ''\\\\' ' 4 children>
										<SyntaxNode_0x3b2b90 705..706 ''' 0 children>
										<SyntaxNode_0x6535b0 706..708 '\\\\' 1 children>
											<SyntaxNode_0x644670 706..708 '\\\\' 1 children>
												<SyntaxNode_0x625660 706..708 '\\\\' 2 children>
													<SyntaxNode_0x64de30 706..707 '\\' 0 children>
													<SyntaxNode_0x646860 707..708 '\\' 0 children>
										<SyntaxNode_0x642a10 708..709 ''' 0 children>
										<SyntaxNode_0x631650 709..710 ' ' 1 children>
											<SyntaxNode_0x65d110 709..710 ' ' 0 children>
							<SyntaxNode_0x6588c0 710..716 '[0-2] ' 1 children>
								<SyntaxNode_0x642240 710..716 '[0-2] ' 1 children>
									<SyntaxNode_0x3bc5a0 710..716 '[0-2] ' 4 children>
										<SyntaxNode_0x63f500 710..711 '[' 0 children>
										<SyntaxNode_0x6009d0 711..714 '0-2' 1 children>
											<SyntaxNode_0x63d050 711..714 '0-2' 1 children>
												<SyntaxNode_0x6466a0 711..714 '0-2' 3 children>
													<SyntaxNode_0x648f30 711..712 '0' 1 children>
														<SyntaxNode_0x3edc10 711..712 '0' 0 children>
													<SyntaxNode_0x321bf0 712..713 '-' 0 children>
													<SyntaxNode_0x630ea0 713..714 '2' 1 children>
														<SyntaxNode_0x61a5d0 713..714 '2' 0 children>
										<SyntaxNode_0x637750 714..715 ']' 0 children>
										<SyntaxNode_0x3dda40 715..716 ' ' 1 children>
											<SyntaxNode_0x61c8d0 715..716 ' ' 0 children>
							<SyntaxNode_0x255680 716..722 '[0-7] ' 1 children>
								<SyntaxNode_0x64c960 716..722 '[0-7] ' 1 children>
									<SyntaxNode_0x3e42d0 716..722 '[0-7] ' 4 children>
										<SyntaxNode_0x66a4e0 716..717 '[' 0 children>
										<SyntaxNode_0x66aaa0 717..720 '0-7' 1 children>
											<SyntaxNode_0x628bf0 717..720 '0-7' 1 children>
												<SyntaxNode_0x653bb0 717..720 '0-7' 3 children>
													<SyntaxNode_0x3efe20 717..718 '0' 1 children>
														<SyntaxNode_0x62a830 717..718 '0' 0 children>
													<SyntaxNode_0x667180 718..719 '-' 0 children>
													<SyntaxNode_0x6416a0 719..720 '7' 1 children>
														<SyntaxNode_0x65aa10 719..720 '7' 0 children>
										<SyntaxNode_0x3f15d0 720..721 ']' 0 children>
										<SyntaxNode_0x63d960 721..722 ' ' 1 children>
											<SyntaxNode_0x669a60 721..722 ' ' 0 children>
							<SyntaxNode_0x6668e0 722..742 '[0-7]\n              ' 1 children>
								<SyntaxNode_0x651a00 722..742 '[0-7]\n              ' 1 children>
									<SyntaxNode_0x61d430 722..742 '[0-7]\n              ' 4 children>
										<SyntaxNode_0x666810 722..723 '[' 0 children>
										<SyntaxNode_0x6087e0 723..726 '0-7' 1 children>
											<SyntaxNode_0x6057e0 723..726 '0-7' 1 children>
												<SyntaxNode_0x3f3840 723..726 '0-7' 3 children>
													<SyntaxNode_0x632a40 723..724 '0' 1 children>
														<SyntaxNode_0x666bd0 723..724 '0' 0 children>
													<SyntaxNode_0x3ceb70 724..725 '-' 0 children>
													<SyntaxNode_0x6083f0 725..726 '7' 1 children>
														<SyntaxNode_0x3e9b90 725..726 '7' 0 children>
										<SyntaxNode_0x649060 726..727 ']' 0 children>
										<SyntaxNode_0x646540 727..742 '\n              ' 15 children>
											<SyntaxNode_0x64d3b0 727..728 '\n' 0 children>
											<SyntaxNode_0x663180 728..729 ' ' 0 children>
											<SyntaxNode_0x641270 729..730 ' ' 0 children>
											<SyntaxNode_0x62cbd0 730..731 ' ' 0 children>
											<SyntaxNode_0x3c6630 731..732 ' ' 0 children>
											<SyntaxNode_0x65a4e0 732..733 ' ' 0 children>
											<SyntaxNode_0x3cebf0 733..734 ' ' 0 children>
											<SyntaxNode_0x654bd0 734..735 ' ' 0 children>
											<SyntaxNode_0x649220 735..736 ' ' 0 children>
											<SyntaxNode_0x3d5800 736..737 ' ' 0 children>
											<SyntaxNode_0x3f8b40 737..738 ' ' 0 children>
											<SyntaxNode_0x655040 738..739 ' ' 0 children>
											<SyntaxNode_0x63c9e0 739..740 ' ' 0 children>
											<SyntaxNode_0x661390 740..741 ' ' 0 children>
											<SyntaxNode_0x65a170 741..742 ' ' 0 children>
					<SyntaxNode_0x3af7c0 742..776 '/ '\\\\' [0-7] [0-7]?\n              ' 2 children>
						<SyntaxNode_0x65c5f0 742..744 '/ ' 2 children>
							<SyntaxNode_0x642f70 742..743 '/' 0 children>
							<SyntaxNode_0x60f700 743..744 ' ' 1 children>
								<SyntaxNode_0x658270 743..744 ' ' 0 children>
						<SyntaxNode_0x66a660 744..776 ''\\\\' [0-7] [0-7]?\n              ' 3 children>
							<SyntaxNode_0x6646e0 744..749 ''\\\\' ' 1 children>
								<SyntaxNode_0x61c530 744..749 ''\\\\' ' 1 children>
									<SyntaxNode_0x3e81d0 744..749 ''\\\\' ' 4 children>
										<SyntaxNode_0x6427d0 744..745 ''' 0 children>
										<SyntaxNode_0x6535b0 745..747 '\\\\' 1 children>
											<SyntaxNode_0x638a10 745..747 '\\\\' 1 children>
												<SyntaxNode_0x64f980 745..747 '\\\\' 2 children>
													<SyntaxNode_0x656bf0 745..746 '\\' 0 children>
													<SyntaxNode_0x645a20 746..747 '\\' 0 children>
										<SyntaxNode_0x644a00 747..748 ''' 0 children>
										<SyntaxNode_0x61ba10 748..749 ' ' 1 children>
											<SyntaxNode_0x65b950 748..749 ' ' 0 children>
							<SyntaxNode_0x626880 749..755 '[0-7] ' 1 children>
								<SyntaxNode_0x62e640 749..755 '[0-7] ' 1 children>
									<SyntaxNode_0x62df10 749..755 '[0-7] ' 4 children>
										<SyntaxNode_0x399db0 749..750 '[' 0 children>
										<SyntaxNode_0x645790 750..753 '0-7' 1 children>
											<SyntaxNode_0x3fbe70 750..753 '0-7' 1 children>
												<SyntaxNode_0x655dd0 750..753 '0-7' 3 children>
													<SyntaxNode_0x666950 750..751 '0' 1 children>
														<SyntaxNode_0x6675e0 750..751 '0' 0 children>
													<SyntaxNode_0x3cc4e0 751..752 '-' 0 children>
													<SyntaxNode_0x64f7d0 752..753 '7' 1 children>
														<SyntaxNode_0x648850 752..753 '7' 0 children>
										<SyntaxNode_0x62b300 753..754 ']' 0 children>
										<SyntaxNode_0x617900 754..755 ' ' 1 children>
											<SyntaxNode_0x6638d0 754..755 ' ' 0 children>
							<SyntaxNode_0x3f49f0 755..776 '[0-7]?\n              ' 1 children>
								<SyntaxNode_0x397980 755..776 '[0-7]?\n              ' 2 children>
									<SyntaxNode_0x3f64a0 755..760 '[0-7]' 3 children>
										<SyntaxNode_0x61c180 755..756 '[' 0 children>
										<SyntaxNode_0x62cff0 756..759 '0-7' 1 children>
											<SyntaxNode_0x3f9c90 756..759 '0-7' 1 children>
												<SyntaxNode_0x263420 756..759 '0-7' 3 children>
													<SyntaxNode_0x3b9640 756..757 '0' 1 children>
														<SyntaxNode_0x610520 756..757 '0' 0 children>
													<SyntaxNode_0x631960 757..758 '-' 0 children>
													<SyntaxNode_0x661c10 758..759 '7' 1 children>
														<SyntaxNode_0x6692c0 758..759 '7' 0 children>
										<SyntaxNode_0x60db50 759..760 ']' 0 children>
									<SyntaxNode_0x62f620 760..776 '?\n              ' 2 children>
										<SyntaxNode_0x606a20 760..761 '?' 0 children>
										<SyntaxNode_0x3f8380 761..776 '\n              ' 15 children>
											<SyntaxNode_0x6036b0 761..762 '\n' 0 children>
											<SyntaxNode_0x3e4d10 762..763 ' ' 0 children>
											<SyntaxNode_0x38db20 763..764 ' ' 0 children>
											<SyntaxNode_0x3f5690 764..765 ' ' 0 children>
											<SyntaxNode_0x653c10 765..766 ' ' 0 children>
											<SyntaxNode_0x6464d0 766..767 ' ' 0 children>
											<SyntaxNode_0x663610 767..768 ' ' 0 children>
											<SyntaxNode_0x652490 768..769 ' ' 0 children>
											<SyntaxNode_0x65b530 769..770 ' ' 0 children>
											<SyntaxNode_0x3f2bf0 770..771 ' ' 0 children>
											<SyntaxNode_0x3a60f0 771..772 ' ' 0 children>
											<SyntaxNode_0x3f4840 772..773 ' ' 0 children>
											<SyntaxNode_0x622bf0 773..774 ' ' 0 children>
											<SyntaxNode_0x39d360 774..775 ' ' 0 children>
											<SyntaxNode_0x654c50 775..776 ' ' 0 children>
					<SyntaxNode_0x601f00 776..786 '/ !'\\\\' .\n' 2 children>
						<SyntaxNode_0x3ce160 776..778 '/ ' 2 children>
							<SyntaxNode_0x6258a0 776..777 '/' 0 children>
							<SyntaxNode_0x6446f0 777..778 ' ' 1 children>
								<SyntaxNode_0x658d00 777..778 ' ' 0 children>
						<SyntaxNode_0x653800 778..786 '!'\\\\' .\n' 2 children>
							<SyntaxNode_0x616170 778..784 '!'\\\\' ' 2 children>
								<SyntaxNode_0x632e90 778..779 '!' 1 children>
									<SyntaxNode_0x633880 778..779 '!' 0 children>
								<SyntaxNode_0x3ebc70 779..784 ''\\\\' ' 1 children>
									<SyntaxNode_0x646dc0 779..784 ''\\\\' ' 4 children>
										<SyntaxNode_0x653a30 779..780 ''' 0 children>
										<SyntaxNode_0x6377f0 780..782 '\\\\' 1 children>
											<SyntaxNode_0x64b490 780..782 '\\\\' 1 children>
												<SyntaxNode_0x3ba550 780..782 '\\\\' 2 children>
													<SyntaxNode_0x62cba0 780..781 '\\' 0 children>
													<SyntaxNode_0x63dbc0 781..782 '\\' 0 children>
										<SyntaxNode_0x60b400 782..783 ''' 0 children>
										<SyntaxNode_0x6351d0 783..784 ' ' 1 children>
											<SyntaxNode_0x663c40 783..784 ' ' 0 children>
							<SyntaxNode_0x653660 784..786 '.\n' 1 children>
								<SyntaxNode_0x618650 784..786 '.\n' 1 children>
									<SyntaxNode_0x3dfc80 784..786 '.\n' 2 children>
										<SyntaxNode_0x658720 784..785 '.' 0 children>
										<SyntaxNode_0x62c4b0 785..786 '\n' 1 children>
											<SyntaxNode_0x64b5f0 785..786 '\n' 0 children>
		<SyntaxNode_0x6189a0 786..813 'LEFTARROW  <- '<-' Spacing\n' 3 children>
			<SyntaxNode_0x6560c0 786..797 'LEFTARROW  ' 3 children>
				<SyntaxNode_0x606310 786..787 'L' 0 children>
				<SyntaxNode_0x607990 787..795 'EFTARROW' 8 children>
					<SyntaxNode_0x3f7400 787..788 'E' 0 children>
					<SyntaxNode_0x6336d0 788..789 'F' 0 children>
					<SyntaxNode_0x61a730 789..790 'T' 0 children>
					<SyntaxNode_0x660370 790..791 'A' 0 children>
					<SyntaxNode_0x6473c0 791..792 'R' 0 children>
					<SyntaxNode_0x649280 792..793 'R' 0 children>
					<SyntaxNode_0x631cf0 793..794 'O' 0 children>
					<SyntaxNode_0x65bba0 794..795 'W' 0 children>
				<SyntaxNode_0x3c12d0 795..797 '  ' 2 children>
					<SyntaxNode_0x3e81d0 795..796 ' ' 0 children>
					<SyntaxNode_0x618950 796..797 ' ' 0 children>
			<SyntaxNode_0x640a70 797..800 '<- ' 2 children>
				<SyntaxNode_0x658370 797..799 '<-' 0 children>
				<SyntaxNode_0x6556b0 799..800 ' ' 1 children>
					<SyntaxNode_0x6482f0 799..800 ' ' 0 children>
			<SyntaxNode_0x601210 800..813 ''<-' Spacing\n' 1 children>
				<SyntaxNode_0x660270 800..813 ''<-' Spacing\n' 2 children>
					<SyntaxNode_0x64a8e0 800..805 ''<-' ' 1 children>
						<SyntaxNode_0x6225b0 800..805 ''<-' ' 1 children>
							<SyntaxNode_0x38c130 800..805 ''<-' ' 4 children>
								<SyntaxNode_0x64e010 800..801 ''' 0 children>
								<SyntaxNode_0x65c150 801..803 '<-' 2 children>
									<SyntaxNode_0x640f50 801..802 '<' 1 children>
										<SyntaxNode_0x649de0 801..802 '<' 1 children>
											<SyntaxNode_0x667bf0 801..802 '<' 0 children>
									<SyntaxNode_0x36c3b0 802..803 '-' 1 children>
										<SyntaxNode_0x607290 802..803 '-' 1 children>
											<SyntaxNode_0x3dde50 802..803 '-' 0 children>
								<SyntaxNode_0x631990 803..804 ''' 0 children>
								<SyntaxNode_0x64dd00 804..805 ' ' 1 children>
									<SyntaxNode_0x3ecb90 804..805 ' ' 0 children>
					<SyntaxNode_0x391120 805..813 'Spacing\n' 1 children>
						<SyntaxNode_0x637e30 805..813 'Spacing\n' 1 children>
							<SyntaxNode_0x604780 805..813 'Spacing\n' 1 children>
								<SyntaxNode_0x630570 805..813 'Spacing\n' 3 children>
									<SyntaxNode_0x629fa0 805..806 'S' 0 children>
									<SyntaxNode_0x6320a0 806..812 'pacing' 6 children>
										<SyntaxNode_0x664480 806..807 'p' 0 children>
										<SyntaxNode_0x65db80 807..808 'a' 0 children>
										<SyntaxNode_0x3c99b0 808..809 'c' 0 children>
										<SyntaxNode_0x62fde0 809..810 'i' 0 children>
										<SyntaxNode_0x650240 810..811 'n' 0 children>
										<SyntaxNode_0x643f90 811..812 'g' 0 children>
									<SyntaxNode_0x6451a0 812..813 '\n' 1 children>
										<SyntaxNode_0x665a80 812..813 '\n' 0 children>
		<SyntaxNode_0x39d0b0 813..839 'SLASH      <- '/' Spacing\n' 3 children>
			<SyntaxNode_0x647a70 813..824 'SLASH      ' 3 children>
				<SyntaxNode_0x3b1d50 813..814 'S' 0 children>
				<SyntaxNode_0x3e6ba0 814..818 'LASH' 4 children>
					<SyntaxNode_0x63b220 814..815 'L' 0 children>
					<SyntaxNode_0x62eea0 815..816 'A' 0 children>
					<SyntaxNode_0x60f700 816..817 'S' 0 children>
					<SyntaxNode_0x61e160 817..818 'H' 0 children>
				<SyntaxNode_0x64d3d0 818..824 '      ' 6 children>
					<SyntaxNode_0x6598b0 818..819 ' ' 0 children>
					<SyntaxNode_0x6080b0 819..820 ' ' 0 children>
					<SyntaxNode_0x3eccb0 820..821 ' ' 0 children>
					<SyntaxNode_0x62b740 821..822 ' ' 0 children>
					<SyntaxNode_0x64d1e0 822..823 ' ' 0 children>
					<SyntaxNode_0x650c20 823..824 ' ' 0 children>
			<SyntaxNode_0x61f6d0 824..827 '<- ' 2 children>
				<SyntaxNode_0x3f48f0 824..826 '<-' 0 children>
				<SyntaxNode_0x65d2b0 826..827 ' ' 1 children>
					<SyntaxNode_0x652db0 826..827 ' ' 0 children>
			<SyntaxNode_0x643290 827..839 ''/' Spacing\n' 1 children>
				<SyntaxNode_0x630310 827..839 ''/' Spacing\n' 2 children>
					<SyntaxNode_0x346eb0 827..831 ''/' ' 1 children>
						<SyntaxNode_0x3f8b40 827..831 ''/' ' 1 children>
							<SyntaxNode_0x64db70 827..831 ''/' ' 4 children>
								<SyntaxNode_0x65b420 827..828 ''' 0 children>
								<SyntaxNode_0x643530 828..829 '/' 1 children>
									<SyntaxNode_0x661390 828..829 '/' 1 children>
										<SyntaxNode_0x656560 828..829 '/' 1 children>
											<SyntaxNode_0x3bf900 828..829 '/' 0 children>
								<SyntaxNode_0x3ab430 829..830 ''' 0 children>
								<SyntaxNode_0x646430 830..831 ' ' 1 children>
									<SyntaxNode_0x639ac0 830..831 ' ' 0 children>
					<SyntaxNode_0x63d360 831..839 'Spacing\n' 1 children>
						<SyntaxNode_0x3e32b0 831..839 'Spacing\n' 1 children>
							<SyntaxNode_0x662190 831..839 'Spacing\n' 1 children>
								<SyntaxNode_0x62ca10 831..839 'Spacing\n' 3 children>
									<SyntaxNode_0x3e40f0 831..832 'S' 0 children>
									<SyntaxNode_0x630e40 832..838 'pacing' 6 children>
										<SyntaxNode_0x600e30 832..833 'p' 0 children>
										<SyntaxNode_0x64cfd0 833..834 'a' 0 children>
										<SyntaxNode_0x648f40 834..835 'c' 0 children>
										<SyntaxNode_0x6560b0 835..836 'i' 0 children>
										<SyntaxNode_0x6479b0 836..837 'n' 0 children>
										<SyntaxNode_0x3a61b0 837..838 'g' 0 children>
									<SyntaxNode_0x658fc0 838..839 '\n' 1 children>
										<SyntaxNode_0x646d20 838..839 '\n' 0 children>
		<SyntaxNode_0x639590 839..865 'AND        <- '&' Spacing\n' 3 children>
			<SyntaxNode_0x66a190 839..850 'AND        ' 3 children>
				<SyntaxNode_0x666550 839..840 'A' 0 children>
				<SyntaxNode_0x3f2f10 840..842 'ND' 2 children>
					<SyntaxNode_0x3e2a60 840..841 'N' 0 children>
					<SyntaxNode_0x3f6a00 841..842 'D' 0 children>
				<SyntaxNode_0x60fd50 842..850 '        ' 8 children>
					<SyntaxNode_0x651020 842..843 ' ' 0 children>
					<SyntaxNode_0x664a80 843..844 ' ' 0 children>
					<SyntaxNode_0x667a60 844..845 ' ' 0 children>
					<SyntaxNode_0x64e9d0 845..846 ' ' 0 children>
					<SyntaxNode_0x3d2890 846..847 ' ' 0 children>
					<SyntaxNode_0x662bf0 847..848 ' ' 0 children>
					<SyntaxNode_0x2f1230 848..849 ' ' 0 children>
					<SyntaxNode_0x63fc40 849..850 ' ' 0 children>
			<SyntaxNode_0x63b130 850..853 '<- ' 2 children>
				<SyntaxNode_0x650c80 850..852 '<-' 0 children>
				<SyntaxNode_0x3cbb10 852..853 ' ' 1 children>
					<SyntaxNode_0x64ed00 852..853 ' ' 0 children>
			<SyntaxNode_0x626210 853..865 ''&' Spacing\n' 1 children>
				<SyntaxNode_0x60b5d0 853..865 ''&' Spacing\n' 2 children>
					<SyntaxNode_0x6493f0 853..857 ''&' ' 1 children>
						<SyntaxNode_0x3b8900 853..857 ''&' ' 1 children>
							<SyntaxNode_0x629ee0 853..857 ''&' ' 4 children>
								<SyntaxNode_0x3b2ad0 853..854 ''' 0 children>
								<SyntaxNode_0x606a20 854..855 '&' 1 children>
									<SyntaxNode_0x612990 854..855 '&' 1 children>
										<SyntaxNode_0x665850 854..855 '&' 1 children>
											<SyntaxNode_0x661930 854..855 '&' 0 children>
								<SyntaxNode_0x3f43f0 855..856 ''' 0 children>
								<SyntaxNode_0x63e460 856..857 ' ' 1 children>
									<SyntaxNode_0x626bb0 856..857 ' ' 0 children>
					<SyntaxNode_0x657370 857..865 'Spacing\n' 1 children>
						<SyntaxNode_0x654080 857..865 'Spacing\n' 1 children>
							<SyntaxNode_0x6236b0 857..865 'Spacing\n' 1 children>
								<SyntaxNode_0x6588a0 857..865 'Spacing\n' 3 children>
									<SyntaxNode_0x661c70 857..858 'S' 0 children>
									<SyntaxNode_0x3a1410 858..864 'pacing' 6 children>
										<SyntaxNode_0x3d3f00 858..859 'p' 0 children>
										<SyntaxNode_0x657de0 859..860 'a' 0 children>
										<SyntaxNode_0x654ac0 860..861 'c' 0 children>
										<SyntaxNode_0x65a4d0 861..862 'i' 0 children>
										<SyntaxNode_0x3db5e0 862..863 'n' 0 children>
										<SyntaxNode_0x65b530 863..864 'g' 0 children>
									<SyntaxNode_0x6675b0 864..865 '\n' 1 children>
										<SyntaxNode_0x62ddb0 864..865 '\n' 0 children>
		<SyntaxNode_0x65e490 865..891 'NOT        <- '!' Spacing\n' 3 children>
			<SyntaxNode_0x634250 865..876 'NOT        ' 3 children>
				<SyntaxNode_0x649140 865..866 'N' 0 children>
				<SyntaxNode_0x3e0d60 866..868 'OT' 2 children>
					<SyntaxNode_0x65ffb0 866..867 'O' 0 children>
					<SyntaxNode_0x668a20 867..868 'T' 0 children>
				<SyntaxNode_0x627340 868..876 '        ' 8 children>
					<SyntaxNode_0x263420 868..869 ' ' 0 children>
					<SyntaxNode_0x397ab0 869..870 ' ' 0 children>
					<SyntaxNode_0x6522d0 870..871 ' ' 0 children>
					<SyntaxNode_0x6400b0 871..872 ' ' 0 children>
					<SyntaxNode_0x3a5120 872..873 ' ' 0 children>
					<SyntaxNode_0x669e80 873..874 ' ' 0 children>
					<SyntaxNode_0x65a4a0 874..875 ' ' 0 children>
					<SyntaxNode_0x6244e0 875..876 ' ' 0 children>
			<SyntaxNode_0x63c4c0 876..879 '<- ' 2 children>
				<SyntaxNode_0x6314a0 876..878 '<-' 0 children>
				<SyntaxNode_0x3a8f10 878..879 ' ' 1 children>
					<SyntaxNode_0x628960 878..879 ' ' 0 children>
			<SyntaxNode_0x656410 879..891 ''!' Spacing\n' 1 children>
				<SyntaxNode_0x60f080 879..891 ''!' Spacing\n' 2 children>
					<SyntaxNode_0x62f870 879..883 ''!' ' 1 children>
						<SyntaxNode_0x64f960 879..883 ''!' ' 1 children>
							<SyntaxNode_0x3c56b0 879..883 ''!' ' 4 children>
								<SyntaxNode_0x651730 879..880 ''' 0 children>
								<SyntaxNode_0x3c4ac0 880..881 '!' 1 children>
									<SyntaxNode_0x3f2b90 880..881 '!' 1 children>
										<SyntaxNode_0x3cd8d0 880..881 '!' 1 children>
											<SyntaxNode_0x3f8380 880..881 '!' 0 children>
								<SyntaxNode_0x60d5f0 881..882 ''' 0 children>
								<SyntaxNode_0x64a820 882..883 ' ' 1 children>
									<SyntaxNode_0x65ecd0 882..883 ' ' 0 children>
					<SyntaxNode_0x629e80 883..891 'Spacing\n' 1 children>
						<SyntaxNode_0x608c30 883..891 'Spacing\n' 1 children>
							<SyntaxNode_0x665030 883..891 'Spacing\n' 1 children>
								<SyntaxNode_0x62c590 883..891 'Spacing\n' 3 children>
									<SyntaxNode_0x658e50 883..884 'S' 0 children>
									<SyntaxNode_0x663c40 884..890 'pacing' 6 children>
										<SyntaxNode_0x649af0 884..885 'p' 0 children>
										<SyntaxNode_0x6508a0 885..886 'a' 0 children>
										<SyntaxNode_0x611520 886..887 'c' 0 children>
										<SyntaxNode_0x653270 887..888 'i' 0 children>
										<SyntaxNode_0x6446f0 888..889 'n' 0 children>
										<SyntaxNode_0x64cee0 889..890 'g' 0 children>
									<SyntaxNode_0x64c910 890..891 '\n' 1 children>
										<SyntaxNode_0x6633b0 890..891 '\n' 0 children>
		<SyntaxNode_0x6391f0 891..917 'QUESTION   <- '?' Spacing\n' 3 children>
			<SyntaxNode_0x3f8320 891..902 'QUESTION   ' 3 children>
				<SyntaxNode_0x3cafd0 891..892 'Q' 0 children>
				<SyntaxNode_0x614560 892..899 'UESTION' 7 children>
					<SyntaxNode_0x641520 892..893 'U' 0 children>
					<SyntaxNode_0x6372b0 893..894 'E' 0 children>
					<SyntaxNode_0x64dcd0 894..895 'S' 0 children>
					<SyntaxNode_0x64f750 895..896 'T' 0 children>
					<SyntaxNode_0x668f90 896..897 'I' 0 children>
					<SyntaxNode_0x6101f0 897..898 'O' 0 children>
					<SyntaxNode_0x64fc40 898..899 'N' 0 children>
				<SyntaxNode_0x39e810 899..902 '   ' 3 children>
					<SyntaxNode_0x63bec0 899..900 ' ' 0 children>
					<SyntaxNode_0x63cca0 900..901 ' ' 0 children>
					<SyntaxNode_0x625cc0 901..902 ' ' 0 children>
			<SyntaxNode_0x64a040 902..905 '<- ' 2 children>
				<SyntaxNode_0x655540 902..904 '<-' 0 children>
				<SyntaxNode_0x64a780 904..905 ' ' 1 children>
					<SyntaxNode_0x601920 904..905 ' ' 0 children>
			<SyntaxNode_0x608450 905..917 ''?' Spacing\n' 1 children>
				<SyntaxNode_0x3aebb0 905..917 ''?' Spacing\n' 2 children>
					<SyntaxNode_0x628960 905..909 ''?' ' 1 children>
						<SyntaxNode_0x6508e0 905..909 ''?' ' 1 children>
							<SyntaxNode_0x61cc00 905..909 ''?' ' 4 children>
								<SyntaxNode_0x62d980 905..906 ''' 0 children>
								<SyntaxNode_0x65f740 906..907 '?' 1 children>
									<SyntaxNode_0x667c80 906..907 '?' 1 children>
										<SyntaxNode_0x3c8db0 906..907 '?' 1 children>
											<SyntaxNode_0x3e8f00 906..907 '?' 0 children>
								<SyntaxNode_0x624220 907..908 ''' 0 children>
								<SyntaxNode_0x627600 908..909 ' ' 1 children>
									<SyntaxNode_0x617500 908..909 ' ' 0 children>
					<SyntaxNode_0x656930 909..917 'Spacing\n' 1 children>
						<SyntaxNode_0x65eec0 909..917 'Spacing\n' 1 children>
							<SyntaxNode_0x649690 909..917 'Spacing\n' 1 children>
								<SyntaxNode_0x643950 909..917 'Spacing\n' 3 children>
									<SyntaxNode_0x6003b0 909..910 'S' 0 children>
									<SyntaxNode_0x6459c0 910..916 'pacing' 6 children>
										<SyntaxNode_0x6418f0 910..911 'p' 0 children>
										<SyntaxNode_0x668a40 911..912 'a' 0 children>
										<SyntaxNode_0x644030 912..913 'c' 0 children>
										<SyntaxNode_0x3bff30 913..914 'i' 0 children>
										<SyntaxNode_0x64a610 914..915 'n' 0 children>
										<SyntaxNode_0x627ad0 915..916 'g' 0 children>
									<SyntaxNode_0x3df780 916..917 '\n' 1 children>
										<SyntaxNode_0x6419d0 916..917 '\n' 0 children>
		<SyntaxNode_0x6511b0 917..943 'STAR       <- '*' Spacing\n' 3 children>
			<SyntaxNode_0x664750 917..928 'STAR       ' 3 children>
				<SyntaxNode_0x60a410 917..918 'S' 0 children>
				<SyntaxNode_0x3e3950 918..921 'TAR' 3 children>
					<SyntaxNode_0x3cf8f0 918..919 'T' 0 children>
					<SyntaxNode_0x64bc20 919..920 'A' 0 children>
					<SyntaxNode_0x633c70 920..921 'R' 0 children>
				<SyntaxNode_0x61f8c0 921..928 '       ' 7 children>
					<SyntaxNode_0x636420 921..922 ' ' 0 children>
					<SyntaxNode_0x64a9c0 922..923 ' ' 0 children>
					<SyntaxNode_0x637b90 923..924 ' ' 0 children>
					<SyntaxNode_0x661ce0 924..925 ' ' 0 children>
					<SyntaxNode_0x3b2970 925..926 ' ' 0 children>
					<SyntaxNode_0x60b040 926..927 ' ' 0 children>
					<SyntaxNode_0x6015c0 927..928 ' ' 0 children>
			<SyntaxNode_0x615f40 928..931 '<- ' 2 children>
				<SyntaxNode_0x63d500 928..930 '<-' 0 children>
				<SyntaxNode_0x639ab0 930..931 ' ' 1 children>
					<SyntaxNode_0x3cebf0 930..931 ' ' 0 children>
			<SyntaxNode_0x60b5d0 931..943 ''*' Spacing\n' 1 children>
				<SyntaxNode_0x64e510 931..943 ''*' Spacing\n' 2 children>
					<SyntaxNode_0x6299f0 931..935 ''*' ' 1 children>
						<SyntaxNode_0x3dd6a0 931..935 ''*' ' 1 children>
							<SyntaxNode_0x3c0e60 931..935 ''*' ' 4 children>
								<SyntaxNode_0x658720 931..932 ''' 0 children>
								<SyntaxNode_0x61c3a0 932..933 '*' 1 children>
									<SyntaxNode_0x6574e0 932..933 '*' 1 children>
										<SyntaxNode_0x652c90 932..933 '*' 1 children>
											<SyntaxNode_0x658410 932..933 '*' 0 children>
								<SyntaxNode_0x3f6c20 933..934 ''' 0 children>
								<SyntaxNode_0x3dee80 934..935 ' ' 1 children>
									<SyntaxNode_0x638320 934..935 ' ' 0 children>
					<SyntaxNode_0x644760 935..943 'Spacing\n' 1 children>
						<SyntaxNode_0x6405b0 935..943 'Spacing\n' 1 children>
							<SyntaxNode_0x66a750 935..943 'Spacing\n' 1 children>
								<SyntaxNode_0x667dd0 935..943 'Spacing\n' 3 children>
									<SyntaxNode_0x32c370 935..936 'S' 0 children>
									<SyntaxNode_0x617c10 936..942 'pacing' 6 children>
										<SyntaxNode_0x643c70 936..937 'p' 0 children>
										<SyntaxNode_0x612950 937..938 'a' 0 children>
										<SyntaxNode_0x63bb40 938..939 'c' 0 children>
										<SyntaxNode_0x645330 939..940 'i' 0 children>
										<SyntaxNode_0x653660 940..941 'n' 0 children>
										<SyntaxNode_0x64a1d0 941..942 'g' 0 children>
									<SyntaxNode_0x2ba220 942..943 '\n' 1 children>
										<SyntaxNode_0x630990 942..943 '\n' 0 children>
		<SyntaxNode_0x65f7a0 943..969 'PLUS       <- '+' Spacing\n' 3 children>
			<SyntaxNode_0x63df30 943..954 'PLUS       ' 3 children>
				<SyntaxNode_0x6501c0 943..944 'P' 0 children>
				<SyntaxNode_0x665cc0 944..947 'LUS' 3 children>
					<SyntaxNode_0x668e90 944..945 'L' 0 children>
					<SyntaxNode_0x61f320 945..946 'U' 0 children>
					<SyntaxNode_0x3f79d0 946..947 'S' 0 children>
				<SyntaxNode_0x630180 947..954 '       ' 7 children>
					<SyntaxNode_0x65e6b0 947..948 ' ' 0 children>
					<SyntaxNode_0x6043f0 948..949 ' ' 0 children>
					<SyntaxNode_0x600940 949..950 ' ' 0 children>
					<SyntaxNode_0x6630d0 950..951 ' ' 0 children>
					<SyntaxNode_0x65c530 951..952 ' ' 0 children>
					<SyntaxNode_0x6697e0 952..953 ' ' 0 children>
					<SyntaxNode_0x63e070 953..954 ' ' 0 children>
			<SyntaxNode_0x622310 954..957 '<- ' 2 children>
				<SyntaxNode_0x627c70 954..956 '<-' 0 children>
				<SyntaxNode_0x668380 956..957 ' ' 1 children>
					<SyntaxNode_0x6658c0 956..957 ' ' 0 children>
			<SyntaxNode_0x605aa0 957..969 ''+' Spacing\n' 1 children>
				<SyntaxNode_0x61f6f0 957..969 ''+' Spacing\n' 2 children>
					<SyntaxNode_0x629670 957..961 ''+' ' 1 children>
						<SyntaxNode_0x65fcc0 957..961 ''+' ' 1 children>
							<SyntaxNode_0x39ebd0 957..961 ''+' ' 4 children>
								<SyntaxNode_0x3c9970 957..958 ''' 0 children>
								<SyntaxNode_0x625e30 958..959 '+' 1 children>
									<SyntaxNode_0x657790 958..959 '+' 1 children>
										<SyntaxNode_0x646030 958..959 '+' 1 children>
											<SyntaxNode_0x3aac80 958..959 '+' 0 children>
								<SyntaxNode_0x6608e0 959..960 ''' 0 children>
								<SyntaxNode_0x6693c0 960..961 ' ' 1 children>
									<SyntaxNode_0x64ef20 960..961 ' ' 0 children>
					<SyntaxNode_0x617660 961..969 'Spacing\n' 1 children>
						<SyntaxNode_0x660a40 961..969 'Spacing\n' 1 children>
							<SyntaxNode_0x631b60 961..969 'Spacing\n' 1 children>
								<SyntaxNode_0x63fe00 961..969 'Spacing\n' 3 children>
									<SyntaxNode_0x632910 961..962 'S' 0 children>
									<SyntaxNode_0x64af50 962..968 'pacing' 6 children>
										<SyntaxNode_0x6656d0 962..963 'p' 0 children>
										<SyntaxNode_0x605840 963..964 'a' 0 children>
										<SyntaxNode_0x3eadc0 964..965 'c' 0 children>
										<SyntaxNode_0x61a730 965..966 'i' 0 children>
										<SyntaxNode_0x65ca10 966..967 'n' 0 children>
										<SyntaxNode_0x65d360 967..968 'g' 0 children>
									<SyntaxNode_0x642470 968..969 '\n' 1 children>
										<SyntaxNode_0x32c370 968..969 '\n' 0 children>
		<SyntaxNode_0x6213c0 969..995 'OPEN       <- '(' Spacing\n' 3 children>
			<SyntaxNode_0x638870 969..980 'OPEN       ' 3 children>
				<SyntaxNode_0x63f050 969..970 'O' 0 children>
				<SyntaxNode_0x648e50 970..973 'PEN' 3 children>
					<SyntaxNode_0x648730 970..971 'P' 0 children>
					<SyntaxNode_0x64daf0 971..972 'E' 0 children>
					<SyntaxNode_0x6556f0 972..973 'N' 0 children>
				<SyntaxNode_0x664730 973..980 '       ' 7 children>
					<SyntaxNode_0x3f2920 973..974 ' ' 0 children>
					<SyntaxNode_0x633880 974..975 ' ' 0 children>
					<SyntaxNode_0x656980 975..976 ' ' 0 children>
					<SyntaxNode_0x668fe0 976..977 ' ' 0 children>
					<SyntaxNode_0x627da0 977..978 ' ' 0 children>
					<SyntaxNode_0x639aa0 978..979 ' ' 0 children>
					<SyntaxNode_0x6466a0 979..980 ' ' 0 children>
			<SyntaxNode_0x6682f0 980..983 '<- ' 2 children>
				<SyntaxNode_0x642470 980..982 '<-' 0 children>
				<SyntaxNode_0x628960 982..983 ' ' 1 children>
					<SyntaxNode_0x3faef0 982..983 ' ' 0 children>
			<SyntaxNode_0x648c10 983..995 ''(' Spacing\n' 1 children>
				<SyntaxNode_0x63c690 983..995 ''(' Spacing\n' 2 children>
					<SyntaxNode_0x622570 983..987 ''(' ' 1 children>
						<SyntaxNode_0x62e6c0 983..987 ''(' ' 1 children>
							<SyntaxNode_0x668c80 983..987 ''(' ' 4 children>
								<SyntaxNode_0x63f820 983..984 ''' 0 children>
								<SyntaxNode_0x666b40 984..985 '(' 1 children>
									<SyntaxNode_0x627f30 984..985 '(' 1 children>
										<SyntaxNode_0x3e6820 984..985 '(' 1 children>
											<SyntaxNode_0x657790 984..985 '(' 0 children>
								<SyntaxNode_0x63d520 985..986 ''' 0 children>
								<SyntaxNode_0x660400 986..987 ' ' 1 children>
									<SyntaxNode_0x6567f0 986..987 ' ' 0 children>
					<SyntaxNode_0x649cf0 987..995 'Spacing\n' 1 children>
						<SyntaxNode_0x633da0 987..995 'Spacing\n' 1 children>
							<SyntaxNode_0x60aab0 987..995 'Spacing\n' 1 children>
								<SyntaxNode_0x3fbb30 987..995 'Spacing\n' 3 children>
									<SyntaxNode_0x6640d0 987..988 'S' 0 children>
									<SyntaxNode_0x3cb760 988..994 'pacing' 6 children>
										<SyntaxNode_0x3dc5c0 988..989 'p' 0 children>
										<SyntaxNode_0x65bfa0 989..990 'a' 0 children>
										<SyntaxNode_0x666da0 990..991 'c' 0 children>
										<SyntaxNode_0x648af0 991..992 'i' 0 children>
										<SyntaxNode_0x3b2ad0 992..993 'n' 0 children>
										<SyntaxNode_0x3d6e90 993..994 'g' 0 children>
									<SyntaxNode_0x659420 994..995 '\n' 1 children>
										<SyntaxNode_0x3ed8c0 994..995 '\n' 0 children>
		<SyntaxNode_0x65eee0 995..1021 'CLOSE      <- ')' Spacing\n' 3 children>
			<SyntaxNode_0x3e3d10 995..1006 'CLOSE      ' 3 children>
				<SyntaxNode_0x636fb0 995..996 'C' 0 children>
				<SyntaxNode_0x60e4d0 996..1000 'LOSE' 4 children>
					<SyntaxNode_0x654400 996..997 'L' 0 children>
					<SyntaxNode_0x3b6350 997..998 'O' 0 children>
					<SyntaxNode_0x6446f0 998..999 'S' 0 children>
					<SyntaxNode_0x648740 999..1000 'E' 0 children>
				<SyntaxNode_0x667fd0 1000..1006 '      ' 6 children>
					<SyntaxNode_0x3a0de0 1000..1001 ' ' 0 children>
					<SyntaxNode_0x65e790 1001..1002 ' ' 0 children>
					<SyntaxNode_0x287df0 1002..1003 ' ' 0 children>
					<SyntaxNode_0x655e30 1003..1004 ' ' 0 children>
					<SyntaxNode_0x606940 1004..1005 ' ' 0 children>
					<SyntaxNode_0x6383a0 1005..1006 ' ' 0 children>
			<SyntaxNode_0x63d740 1006..1009 '<- ' 2 children>
				<SyntaxNode_0x634710 1006..1008 '<-' 0 children>
				<SyntaxNode_0x6434f0 1008..1009 ' ' 1 children>
					<SyntaxNode_0x641af0 1008..1009 ' ' 0 children>
			<SyntaxNode_0x653670 1009..1021 '')' Spacing\n' 1 children>
				<SyntaxNode_0x62b7a0 1009..1021 '')' Spacing\n' 2 children>
					<SyntaxNode_0x60da50 1009..1013 '')' ' 1 children>
						<SyntaxNode_0x620310 1009..1013 '')' ' 1 children>
							<SyntaxNode_0x653710 1009..1013 '')' ' 4 children>
								<SyntaxNode_0x618e80 1009..1010 ''' 0 children>
								<SyntaxNode_0x6637f0 1010..1011 ')' 1 children>
									<SyntaxNode_0x666e60 1010..1011 ')' 1 children>
										<SyntaxNode_0x63c8e0 1010..1011 ')' 1 children>
											<SyntaxNode_0x6272b0 1010..1011 ')' 0 children>
								<SyntaxNode_0x648c50 1011..1012 ''' 0 children>
								<SyntaxNode_0x3f4a20 1012..1013 ' ' 1 children>
									<SyntaxNode_0x3d32e0 1012..1013 ' ' 0 children>
					<SyntaxNode_0x6480d0 1013..1021 'Spacing\n' 1 children>
						<SyntaxNode_0x3abba0 1013..1021 'Spacing\n' 1 children>
							<SyntaxNode_0x616350 1013..1021 'Spacing\n' 1 children>
								<SyntaxNode_0x65f370 1013..1021 'Spacing\n' 3 children>
									<SyntaxNode_0x3bff30 1013..1014 'S' 0 children>
									<SyntaxNode_0x3c4510 1014..1020 'pacing' 6 children>
										<SyntaxNode_0x62ea30 1014..1015 'p' 0 children>
										<SyntaxNode_0x668cf0 1015..1016 'a' 0 children>
										<SyntaxNode_0x64c020 1016..1017 'c' 0 children>
										<SyntaxNode_0x64a2f0 1017..1018 'i' 0 children>
										<SyntaxNode_0x664240 1018..1019 'n' 0 children>
										<SyntaxNode_0x3fb870 1019..1020 'g' 0 children>
									<SyntaxNode_0x3666c0 1020..1021 '\n' 1 children>
										<SyntaxNode_0x61c5e0 1020..1021 '\n' 0 children>
		<SyntaxNode_0x624a50 1021..1047 'DOT        <- '.' Spacing\n' 3 children>
			<SyntaxNode_0x639590 1021..1032 'DOT        ' 3 children>
				<SyntaxNode_0x65cec0 1021..1022 'D' 0 children>
				<SyntaxNode_0x6685d0 1022..1024 'OT' 2 children>
					<SyntaxNode_0x665270 1022..1023 'O' 0 children>
					<SyntaxNode_0x3f09e0 1023..1024 'T' 0 children>
				<SyntaxNode_0x612c10 1024..1032 '        ' 8 children>
					<SyntaxNode_0x610290 1024..1025 ' ' 0 children>
					<SyntaxNode_0x618d30 1025..1026 ' ' 0 children>
					<SyntaxNode_0x64e190 1026..1027 ' ' 0 children>
					<SyntaxNode_0x669770 1027..1028 ' ' 0 children>
					<SyntaxNode_0x667460 1028..1029 ' ' 0 children>
					<SyntaxNode_0x629a40 1029..1030 ' ' 0 children>
					<SyntaxNode_0x635780 1030..1031 ' ' 0 children>
					<SyntaxNode_0x604b40 1031..1032 ' ' 0 children>
			<SyntaxNode_0x633b10 1032..1035 '<- ' 2 children>
				<SyntaxNode_0x630e40 1032..1034 '<-' 0 children>
				<SyntaxNode_0x61a730 1034..1035 ' ' 1 children>
					<SyntaxNode_0x65c130 1034..1035 ' ' 0 children>
			<SyntaxNode_0x614420 1035..1047 ''.' Spacing\n' 1 children>
				<SyntaxNode_0x6210b0 1035..1047 ''.' Spacing\n' 2 children>
					<SyntaxNode_0x64b980 1035..1039 ''.' ' 1 children>
						<SyntaxNode_0x633a10 1035..1039 ''.' ' 1 children>
							<SyntaxNode_0x60df30 1035..1039 ''.' ' 4 children>
								<SyntaxNode_0x3cdf30 1035..1036 ''' 0 children>
								<SyntaxNode_0x643d30 1036..1037 '.' 1 children>
									<SyntaxNode_0x658510 1036..1037 '.' 1 children>
										<SyntaxNode_0x669c70 1036..1037 '.' 1 children>
											<SyntaxNode_0x64f960 1036..1037 '.' 0 children>
								<SyntaxNode_0x65b530 1037..1038 ''' 0 children>
								<SyntaxNode_0x660da0 1038..1039 ' ' 1 children>
									<SyntaxNode_0x3f58d0 1038..1039 ' ' 0 children>
					<SyntaxNode_0x610290 1039..1047 'Spacing\n' 1 children>
						<SyntaxNode_0x3cc090 1039..1047 'Spacing\n' 1 children>
							<SyntaxNode_0x65b170 1039..1047 'Spacing\n' 1 children>
								<SyntaxNode_0x65ec50 1039..1047 'Spacing\n' 3 children>
									<SyntaxNode_0x64f160 1039..1040 'S' 0 children>
									<SyntaxNode_0x650570 1040..1046 'pacing' 6 children>
										<SyntaxNode_0x604b40 1040..1041 'p' 0 children>
										<SyntaxNode_0x627c70 1041..1042 'a' 0 children>
										<SyntaxNode_0x642390 1042..1043 'c' 0 children>
										<SyntaxNode_0x65fbc0 1043..1044 'i' 0 children>
										<SyntaxNode_0x64c010 1044..1045 'n' 0 children>
										<SyntaxNode_0x3c56b0 1045..1046 'g' 0 children>
									<SyntaxNode_0x2700d0 1046..1047 '\n' 1 children>
										<SyntaxNode_0x62e9a0 1046..1047 '\n' 0 children>
		<SyntaxNode_0x6235f0 1047..1080 'Spacing    <- (Space / Comment)*\n' 3 children>
			<SyntaxNode_0x624730 1047..1058 'Spacing    ' 3 children>
				<SyntaxNode_0x6400b0 1047..1048 'S' 0 children>
				<SyntaxNode_0x6627d0 1048..1054 'pacing' 6 children>
					<SyntaxNode_0x3e89d0 1048..1049 'p' 0 children>
					<SyntaxNode_0x3dda20 1049..1050 'a' 0 children>
					<SyntaxNode_0x614a90 1050..1051 'c' 0 children>
					<SyntaxNode_0x633ae0 1051..1052 'i' 0 children>
					<SyntaxNode_0x3fa150 1052..1053 'n' 0 children>
					<SyntaxNode_0x3e3dd0 1053..1054 'g' 0 children>
				<SyntaxNode_0x657160 1054..1058 '    ' 4 children>
					<SyntaxNode_0x626460 1054..1055 ' ' 0 children>
					<SyntaxNode_0x629930 1055..1056 ' ' 0 children>
					<SyntaxNode_0x614120 1056..1057 ' ' 0 children>
					<SyntaxNode_0x3f3670 1057..1058 ' ' 0 children>
			<SyntaxNode_0x65e790 1058..1061 '<- ' 2 children>
				<SyntaxNode_0x61e920 1058..1060 '<-' 0 children>
				<SyntaxNode_0x601a50 1060..1061 ' ' 1 children>
					<SyntaxNode_0x649220 1060..1061 ' ' 0 children>
			<SyntaxNode_0x65e7f0 1061..1080 '(Space / Comment)*\n' 1 children>
				<SyntaxNode_0x609960 1061..1080 '(Space / Comment)*\n' 1 children>
					<SyntaxNode_0x621bc0 1061..1080 '(Space / Comment)*\n' 1 children>
						<SyntaxNode_0x608050 1061..1080 '(Space / Comment)*\n' 2 children>
							<SyntaxNode_0x3abb90 1061..1078 '(Space / Comment)' 3 children>
								<SyntaxNode_0x629d00 1061..1062 '(' 1 children>
									<SyntaxNode_0x626530 1061..1062 '(' 0 children>
								<SyntaxNode_0x3e9510 1062..1077 'Space / Comment' 2 children>
									<SyntaxNode_0x3ee220 1062..1068 'Space ' 1 children>
										<SyntaxNode_0x64b6e0 1062..1068 'Space ' 1 children>
											<SyntaxNode_0x63ae90 1062..1068 'Space ' 1 children>
												<SyntaxNode_0x65b8f0 1062..1068 'Space ' 1 children>
													<SyntaxNode_0x662a40 1062..1068 'Space ' 3 children>
														<SyntaxNode_0x649030 1062..1063 'S' 0 children>
														<SyntaxNode_0x255680 1063..1067 'pace' 4 children>
															<SyntaxNode_0x64fc80 1063..1064 'p' 0 children>
															<SyntaxNode_0x62f8e0 1064..1065 'a' 0 children>
															<SyntaxNode_0x626dd0 1065..1066 'c' 0 children>
															<SyntaxNode_0x651c40 1066..1067 'e' 0 children>
														<SyntaxNode_0x3a0580 1067..1068 ' ' 1 children>
															<SyntaxNode_0x63bec0 1067..1068 ' ' 0 children>
									<SyntaxNode_0x635380 1068..1077 '/ Comment' 1 children>
										<SyntaxNode_0x665d40 1068..1077 '/ Comment' 2 children>
											<SyntaxNode_0x667be0 1068..1070 '/ ' 2 children>
												<SyntaxNode_0x662e30 1068..1069 '/' 0 children>
												<SyntaxNode_0x604ca0 1069..1070 ' ' 1 children>
													<SyntaxNode_0x662950 1069..1070 ' ' 0 children>
											<SyntaxNode_0x6520f0 1070..1077 'Comment' 1 children>
												<SyntaxNode_0x663fb0 1070..1077 'Comment' 1 children>
													<SyntaxNode_0x65ab60 1070..1077 'Comment' 1 children>
														<SyntaxNode_0x63ddc0 1070..1077 'Comment' 1 children>
															<SyntaxNode_0x63e460 1070..1077 'Comment' 2 children>
																<SyntaxNode_0x3b4b60 1070..1071 'C' 0 children>
																<SyntaxNode_0x653cd0 1071..1077 'omment' 6 children>
																	<SyntaxNode_0x62f4b0 1071..1072 'o' 0 children>
																	<SyntaxNode_0x3f7310 1072..1073 'm' 0 children>
																	<SyntaxNode_0x633b10 1073..1074 'm' 0 children>
																	<SyntaxNode_0x617550 1074..1075 'e' 0 children>
																	<SyntaxNode_0x662c40 1075..1076 'n' 0 children>
																	<SyntaxNode_0x657840 1076..1077 't' 0 children>
								<SyntaxNode_0x627110 1077..1078 ')' 1 children>
									<SyntaxNode_0x3cb090 1077..1078 ')' 0 children>
							<SyntaxNode_0x646b60 1078..1080 '*\n' 2 children>
								<SyntaxNode_0x6478a0 1078..1079 '*' 0 children>
								<SyntaxNode_0x661000 1079..1080 '\n' 1 children>
									<SyntaxNode_0x661900 1079..1080 '\n' 0 children>
		<SyntaxNode_0x631df0 1080..1124 'Comment    <- '#' (!EndOfLine .)* EndOfLine\n' 3 children>
			<SyntaxNode_0x3e3950 1080..1091 'Comment    ' 3 children>
				<SyntaxNode_0x611140 1080..1081 'C' 0 children>
				<SyntaxNode_0x63bb80 1081..1087 'omment' 6 children>
					<SyntaxNode_0x3c17a0 1081..1082 'o' 0 children>
					<SyntaxNode_0x3a3690 1082..1083 'm' 0 children>
					<SyntaxNode_0x63d6b0 1083..1084 'm' 0 children>
					<SyntaxNode_0x660070 1084..1085 'e' 0 children>
					<SyntaxNode_0x3e63d0 1085..1086 'n' 0 children>
					<SyntaxNode_0x668d40 1086..1087 't' 0 children>
				<SyntaxNode_0x655840 1087..1091 '    ' 4 children>
					<SyntaxNode_0x3bab70 1087..1088 ' ' 0 children>
					<SyntaxNode_0x6440d0 1088..1089 ' ' 0 children>
					<SyntaxNode_0x63ec50 1089..1090 ' ' 0 children>
					<SyntaxNode_0x3eeb20 1090..1091 ' ' 0 children>
			<SyntaxNode_0x62b680 1091..1094 '<- ' 2 children>
				<SyntaxNode_0x64b8d0 1091..1093 '<-' 0 children>
				<SyntaxNode_0x62cff0 1093..1094 ' ' 1 children>
					<SyntaxNode_0x66a760 1093..1094 ' ' 0 children>
			<SyntaxNode_0x650f60 1094..1124 ''#' (!EndOfLine .)* EndOfLine\n' 1 children>
				<SyntaxNode_0x3cae80 1094..1124 ''#' (!EndOfLine .)* EndOfLine\n' 3 children>
					<SyntaxNode_0x3a7360 1094..1098 ''#' ' 1 children>
						<SyntaxNode_0x63d240 1094..1098 ''#' ' 1 children>
							<SyntaxNode_0x655b50 1094..1098 ''#' ' 4 children>
								<SyntaxNode_0x63d500 1094..1095 ''' 0 children>
								<SyntaxNode_0x6593b0 1095..1096 '#' 1 children>
									<SyntaxNode_0x6677c0 1095..1096 '#' 1 children>
										<SyntaxNode_0x644250 1095..1096 '#' 1 children>
											<SyntaxNode_0x38f680 1095..1096 '#' 0 children>
								<SyntaxNode_0x65b040 1096..1097 ''' 0 children>
								<SyntaxNode_0x610520 1097..1098 ' ' 1 children>
									<SyntaxNode_0x647450 1097..1098 ' ' 0 children>
					<SyntaxNode_0x624a50 1098..1114 '(!EndOfLine .)* ' 1 children>
						<SyntaxNode_0x3baa60 1098..1114 '(!EndOfLine .)* ' 2 children>
							<SyntaxNode_0x3c5670 1098..1112 '(!EndOfLine .)' 3 children>
								<SyntaxNode_0x65d730 1098..1099 '(' 1 children>
									<SyntaxNode_0x64c3b0 1098..1099 '(' 0 children>
								<SyntaxNode_0x3b9640 1099..1111 '!EndOfLine .' 1 children>
									<SyntaxNode_0x61ab60 1099..1111 '!EndOfLine .' 2 children>
										<SyntaxNode_0x629fa0 1099..1110 '!EndOfLine ' 2 children>
											<SyntaxNode_0x63a900 1099..1100 '!' 1 children>
												<SyntaxNode_0x649570 1099..1100 '!' 0 children>
											<SyntaxNode_0x654870 1100..1110 'EndOfLine ' 1 children>
												<SyntaxNode_0x3e5e00 1100..1110 'EndOfLine ' 1 children>
													<SyntaxNode_0x657f50 1100..1110 'EndOfLine ' 3 children>
														<SyntaxNode_0x648e50 1100..1101 'E' 0 children>
														<SyntaxNode_0x62a130 1101..1109 'ndOfLine' 8 children>
															<SyntaxNode_0x651690 1101..1102 'n' 0 children>
															<SyntaxNode_0x643a10 1102..1103 'd' 0 children>
															<SyntaxNode_0x395a30 1103..1104 'O' 0 children>
															<SyntaxNode_0x625f70 1104..1105 'f' 0 children>
															<SyntaxNode_0x634740 1105..1106 'L' 0 children>
															<SyntaxNode_0x662310 1106..1107 'i' 0 children>
															<SyntaxNode_0x62c750 1107..1108 'n' 0 children>
															<SyntaxNode_0x3cf170 1108..1109 'e' 0 children>
														<SyntaxNode_0x63d1e0 1109..1110 ' ' 1 children>
															<SyntaxNode_0x652210 1109..1110 ' ' 0 children>
										<SyntaxNode_0x64e0a0 1110..1111 '.' 1 children>
											<SyntaxNode_0x648040 1110..1111 '.' 1 children>
												<SyntaxNode_0x60df30 1110..1111 '.' 1 children>
													<SyntaxNode_0x652950 1110..1111 '.' 0 children>
								<SyntaxNode_0x65aff0 1111..1112 ')' 1 children>
									<SyntaxNode_0x600940 1111..1112 ')' 0 children>
							<SyntaxNode_0x6678b0 1112..1114 '* ' 2 children>
								<SyntaxNode_0x3a4f90 1112..1113 '*' 0 children>
								<SyntaxNode_0x65a370 1113..1114 ' ' 1 children>
									<SyntaxNode_0x622e90 1113..1114 ' ' 0 children>
					<SyntaxNode_0x639010 1114..1124 'EndOfLine\n' 1 children>
						<SyntaxNode_0x64cb20 1114..1124 'EndOfLine\n' 1 children>
							<SyntaxNode_0x6426d0 1114..1124 'EndOfLine\n' 1 children>
								<SyntaxNode_0x65a420 1114..1124 'EndOfLine\n' 3 children>
									<SyntaxNode_0x627830 1114..1115 'E' 0 children>
									<SyntaxNode_0x65db80 1115..1123 'ndOfLine' 8 children>
										<SyntaxNode_0x6329a0 1115..1116 'n' 0 children>
										<SyntaxNode_0x3ac940 1116..1117 'd' 0 children>
										<SyntaxNode_0x3f3840 1117..1118 'O' 0 children>
										<SyntaxNode_0x61f460 1118..1119 'f' 0 children>
										<SyntaxNode_0x663bb0 1119..1120 'L' 0 children>
										<SyntaxNode_0x63f2b0 1120..1121 'i' 0 children>
										<SyntaxNode_0x63e010 1121..1122 'n' 0 children>
										<SyntaxNode_0x3f8130 1122..1123 'e' 0 children>
									<SyntaxNode_0x63bf30 1123..1124 '\n' 1 children>
										<SyntaxNode_0x631220 1123..1124 '\n' 0 children>
		<SyntaxNode_0x65edc0 1124..1161 'Space      <- ' ' / '\\t' / EndOfLine\n' 3 children>
			<SyntaxNode_0x65bdd0 1124..1135 'Space      ' 3 children>
				<SyntaxNode_0x666c50 1124..1125 'S' 0 children>
				<SyntaxNode_0x3d3530 1125..1129 'pace' 4 children>
					<SyntaxNode_0x66a5e0 1125..1126 'p' 0 children>
					<SyntaxNode_0x3c7380 1126..1127 'a' 0 children>
					<SyntaxNode_0x3b8370 1127..1128 'c' 0 children>
					<SyntaxNode_0x627bf0 1128..1129 'e' 0 children>
				<SyntaxNode_0x62dbf0 1129..1135 '      ' 6 children>
					<SyntaxNode_0x636390 1129..1130 ' ' 0 children>
					<SyntaxNode_0x634c60 1130..1131 ' ' 0 children>
					<SyntaxNode_0x64c250 1131..1132 ' ' 0 children>
					<SyntaxNode_0x2af0a0 1132..1133 ' ' 0 children>
					<SyntaxNode_0x660990 1133..1134 ' ' 0 children>
					<SyntaxNode_0x600320 1134..1135 ' ' 0 children>
			<SyntaxNode_0x3f49f0 1135..1138 '<- ' 2 children>
				<SyntaxNode_0x62a7a0 1135..1137 '<-' 0 children>
				<SyntaxNode_0x3c9460 1137..1138 ' ' 1 children>
					<SyntaxNode_0x64ab90 1137..1138 ' ' 0 children>
			<SyntaxNode_0x657ba0 1138..1161 '' ' / '\\t' / EndOfLine\n' 2 children>
				<SyntaxNode_0x669eb0 1138..1142 '' ' ' 1 children>
					<SyntaxNode_0x6578c0 1138..1142 '' ' ' 1 children>
						<SyntaxNode_0x3c5650 1138..1142 '' ' ' 1 children>
							<SyntaxNode_0x351c30 1138..1142 '' ' ' 4 children>
								<SyntaxNode_0x3efac0 1138..1139 ''' 0 children>
								<SyntaxNode_0x64bcc0 1139..1140 ' ' 1 children>
									<SyntaxNode_0x6592c0 1139..1140 ' ' 1 children>
										<SyntaxNode_0x3bdc80 1139..1140 ' ' 1 children>
											<SyntaxNode_0x64a9c0 1139..1140 ' ' 0 children>
								<SyntaxNode_0x669800 1140..1141 ''' 0 children>
								<SyntaxNode_0x3ca230 1141..1142 ' ' 1 children>
									<SyntaxNode_0x627110 1141..1142 ' ' 0 children>
				<SyntaxNode_0x3efed0 1142..1161 '/ '\\t' / EndOfLine\n' 2 children>
					<SyntaxNode_0x626cb0 1142..1149 '/ '\\t' ' 2 children>
						<SyntaxNode_0x60b330 1142..1144 '/ ' 2 children>
							<SyntaxNode_0x60ad80 1142..1143 '/' 0 children>
							<SyntaxNode_0x65e4f0 1143..1144 ' ' 1 children>
								<SyntaxNode_0x3cc6f0 1143..1144 ' ' 0 children>
						<SyntaxNode_0x3eed90 1144..1149 ''\\t' ' 1 children>
							<SyntaxNode_0x648ed0 1144..1149 ''\\t' ' 1 children>
								<SyntaxNode_0x39b560 1144..1149 ''\\t' ' 1 children>
									<SyntaxNode_0x6370d0 1144..1149 ''\\t' ' 4 children>
										<SyntaxNode_0x6158f0 1144..1145 ''' 0 children>
										<SyntaxNode_0x65dd30 1145..1147 '\\t' 1 children>
											<SyntaxNode_0x64ab40 1145..1147 '\\t' 1 children>
												<SyntaxNode_0x65d4d0 1145..1147 '\\t' 2 children>
													<SyntaxNode_0x623490 1145..1146 '\\' 0 children>
													<SyntaxNode_0x3ac140 1146..1147 't' 0 children>
										<SyntaxNode_0x640af0 1147..1148 ''' 0 children>
										<SyntaxNode_0x6673c0 1148..1149 ' ' 1 children>
											<SyntaxNode_0x65a4a0 1148..1149 ' ' 0 children>
					<SyntaxNode_0x669580 1149..1161 '/ EndOfLine\n' 2 children>
						<SyntaxNode_0x630310 1149..1151 '/ ' 2 children>
							<SyntaxNode_0x60dff0 1149..1150 '/' 0 children>
							<SyntaxNode_0x3a3420 1150..1151 ' ' 1 children>
								<SyntaxNode_0x65b790 1150..1151 ' ' 0 children>
						<SyntaxNode_0x669330 1151..1161 'EndOfLine\n' 1 children>
							<SyntaxNode_0x62d000 1151..1161 'EndOfLine\n' 1 children>
								<SyntaxNode_0x65a470 1151..1161 'EndOfLine\n' 1 children>
									<SyntaxNode_0x662a10 1151..1161 'EndOfLine\n' 1 children>
										<SyntaxNode_0x62aad0 1151..1161 'EndOfLine\n' 3 children>
											<SyntaxNode_0x3b0230 1151..1152 'E' 0 children>
											<SyntaxNode_0x642a90 1152..1160 'ndOfLine' 8 children>
												<SyntaxNode_0x6405c0 1152..1153 'n' 0 children>
												<SyntaxNode_0x665d70 1153..1154 'd' 0 children>
												<SyntaxNode_0x660520 1154..1155 'O' 0 children>
												<SyntaxNode_0x3a8360 1155..1156 'f' 0 children>
												<SyntaxNode_0x394840 1156..1157 'L' 0 children>
												<SyntaxNode_0x669520 1157..1158 'i' 0 children>
												<SyntaxNode_0x64d040 1158..1159 'n' 0 children>
												<SyntaxNode_0x62b9b0 1159..1160 'e' 0 children>
											<SyntaxNode_0x656530 1160..1161 '\n' 1 children>
												<SyntaxNode_0x3cd390 1160..1161 '\n' 0 children>
		<SyntaxNode_0x3a8540 1161..1196 'EndOfLine  <- '\\r\\n' / '\\n' / '\\r'\n' 3 children>
			<SyntaxNode_0x63f5a0 1161..1172 'EndOfLine  ' 3 children>
				<SyntaxNode_0x61d940 1161..1162 'E' 0 children>
				<SyntaxNode_0x616fc0 1162..1170 'ndOfLine' 8 children>
					<SyntaxNode_0x635390 1162..1163 'n' 0 children>
					<SyntaxNode_0x6482b0 1163..1164 'd' 0 children>
					<SyntaxNode_0x3dd210 1164..1165 'O' 0 children>
					<SyntaxNode_0x65d4c0 1165..1166 'f' 0 children>
					<SyntaxNode_0x632d70 1166..1167 'L' 0 children>
					<SyntaxNode_0x613ba0 1167..1168 'i' 0 children>
					<SyntaxNode_0x63a9e0 1168..1169 'n' 0 children>
					<SyntaxNode_0x604860 1169..1170 'e' 0 children>
				<SyntaxNode_0x3976c0 1170..1172 '  ' 2 children>
					<SyntaxNode_0x656ac0 1170..1171 ' ' 0 children>
					<SyntaxNode_0x65e1f0 1171..1172 ' ' 0 children>
			<SyntaxNode_0x3f7130 1172..1175 '<- ' 2 children>
				<SyntaxNode_0x648980 1172..1174 '<-' 0 children>
				<SyntaxNode_0x6265f0 1174..1175 ' ' 1 children>
					<SyntaxNode_0x6163c0 1174..1175 ' ' 0 children>
			<SyntaxNode_0x62a7a0 1175..1196 ''\\r\\n' / '\\n' / '\\r'\n' 2 children>
				<SyntaxNode_0x6235f0 1175..1182 ''\\r\\n' ' 1 children>
					<SyntaxNode_0x641a10 1175..1182 ''\\r\\n' ' 1 children>
						<SyntaxNode_0x393fa0 1175..1182 ''\\r\\n' ' 1 children>
							<SyntaxNode_0x63a900 1175..1182 ''\\r\\n' ' 4 children>
								<SyntaxNode_0x3dc500 1175..1176 ''' 0 children>
								<SyntaxNode_0x667510 1176..1180 '\\r\\n' 2 children>
									<SyntaxNode_0x633d40 1176..1178 '\\r' 1 children>
										<SyntaxNode_0x6391f0 1176..1178 '\\r' 2 children>
											<SyntaxNode_0x3e0240 1176..1177 '\\' 0 children>
											<SyntaxNode_0x65cb80 1177..1178 'r' 0 children>
									<SyntaxNode_0x63d390 1178..1180 '\\n' 1 children>
										<SyntaxNode_0x6134a0 1178..1180 '\\n' 2 children>
											<SyntaxNode_0x64bcc0 1178..1179 '\\' 0 children>
											<SyntaxNode_0x3e5280 1179..1180 'n' 0 children>
								<SyntaxNode_0x60fd50 1180..1181 ''' 0 children>
								<SyntaxNode_0x6540a0 1181..1182 ' ' 1 children>
									<SyntaxNode_0x655f50 1181..1182 ' ' 0 children>
				<SyntaxNode_0x65a010 1182..1196 '/ '\\n' / '\\r'\n' 2 children>
					<SyntaxNode_0x396030 1182..1189 '/ '\\n' ' 2 children>
						<SyntaxNode_0x6587c0 1182..1184 '/ ' 2 children>
							<SyntaxNode_0x3ed540 1182..1183 '/' 0 children>
							<SyntaxNode_0x3ed990 1183..1184 ' ' 1 children>
								<SyntaxNode_0x644680 1183..1184 ' ' 0 children>
						<SyntaxNode_0x63c380 1184..1189 ''\\n' ' 1 children>
							<SyntaxNode_0x6668d0 1184..1189 ''\\n' ' 1 children>
								<SyntaxNode_0x65ad50 1184..1189 ''\\n' ' 1 children>
									<SyntaxNode_0x64ddc0 1184..1189 ''\\n' ' 4 children>
										<SyntaxNode_0x650570 1184..1185 ''' 0 children>
										<SyntaxNode_0x3c6960 1185..1187 '\\n' 1 children>
											<SyntaxNode_0x61a370 1185..1187 '\\n' 1 children>
												<SyntaxNode_0x65f0d0 1185..1187 '\\n' 2 children>
													<SyntaxNode_0x6639a0 1185..1186 '\\' 0 children>
													<SyntaxNode_0x666ed0 1186..1187 'n' 0 children>
										<SyntaxNode_0x60e2f0 1187..1188 ''' 0 children>
										<SyntaxNode_0x3d2ec0 1188..1189 ' ' 1 children>
											<SyntaxNode_0x649f60 1188..1189 ' ' 0 children>
					<SyntaxNode_0x62cce0 1189..1196 '/ '\\r'\n' 2 children>
						<SyntaxNode_0x650ec0 1189..1191 '/ ' 2 children>
							<SyntaxNode_0x62d450 1189..1190 '/' 0 children>
							<SyntaxNode_0x6495f0 1190..1191 ' ' 1 children>
								<SyntaxNode_0x644880 1190..1191 ' ' 0 children>
						<SyntaxNode_0x3dd450 1191..1196 ''\\r'\n' 1 children>
							<SyntaxNode_0x3a2290 1191..1196 ''\\r'\n' 1 children>
								<SyntaxNode_0x3c2400 1191..1196 ''\\r'\n' 1 children>
									<SyntaxNode_0x623f10 1191..1196 ''\\r'\n' 4 children>
										<SyntaxNode_0x6451d0 1191..1192 ''' 0 children>
										<SyntaxNode_0x62b9b0 1192..1194 '\\r' 1 children>
											<SyntaxNode_0x660f40 1192..1194 '\\r' 1 children>
												<SyntaxNode_0x65d820 1192..1194 '\\r' 2 children>
													<SyntaxNode_0x3ac880 1192..1193 '\\' 0 children>
													<SyntaxNode_0x645840 1193..1194 'r' 0 children>
										<SyntaxNode_0x616bf0 1194..1195 ''' 0 children>
										<SyntaxNode_0x637710 1195..1196 '\n' 1 children>
											<SyntaxNode_0x637430 1195..1196 '\n' 0 children>
		<SyntaxNode_0x3a5610 1196..1213 'EndOfFile  <- !.\n' 3 children>
			<SyntaxNode_0x3f8130 1196..1207 'EndOfFile  ' 3 children>
				<SyntaxNode_0x3e6a70 1196..1197 'E' 0 children>
				<SyntaxNode_0x63b130 1197..1205 'ndOfFile' 8 children>
					<SyntaxNode_0x3df970 1197..1198 'n' 0 children>
					<SyntaxNode_0x3afc10 1198..1199 'd' 0 children>
					<SyntaxNode_0x600940 1199..1200 'O' 0 children>
					<SyntaxNode_0x64b370 1200..1201 'f' 0 children>
					<SyntaxNode_0x60dec0 1201..1202 'F' 0 children>
					<SyntaxNode_0x660290 1202..1203 'i' 0 children>
					<SyntaxNode_0x3ae710 1203..1204 'l' 0 children>
					<SyntaxNode_0x3b8370 1204..1205 'e' 0 children>
				<SyntaxNode_0x61d2b0 1205..1207 '  ' 2 children>
					<SyntaxNode_0x669a60 1205..1206 ' ' 0 children>
					<SyntaxNode_0x60b330 1206..1207 ' ' 0 children>
			<SyntaxNode_0x63dd60 1207..1210 '<- ' 2 children>
				<SyntaxNode_0x6568d0 1207..1209 '<-' 0 children>
				<SyntaxNode_0x6357a0 1209..1210 ' ' 1 children>
					<SyntaxNode_0x658bd0 1209..1210 ' ' 0 children>
			<SyntaxNode_0x3d2b00 1210..1213 '!.\n' 1 children>
				<SyntaxNode_0x62bdb0 1210..1213 '!.\n' 1 children>
					<SyntaxNode_0x60be00 1210..1213 '!.\n' 2 children>
						<SyntaxNode_0x3f4840 1210..1211 '!' 1 children>
							<SyntaxNode_0x62c410 1210..1211 '!' 0 children>
						<SyntaxNode_0x666900 1211..1213 '.\n' 1 children>
							<SyntaxNode_0x3bab10 1211..1213 '.\n' 2 children>
								<SyntaxNode_0x3a7930 1211..1212 '.' 0 children>
								<SyntaxNode_0x663430 1212..1213 '\n' 1 children>
									<SyntaxNode_0x630820 1212..1213 '\n' 0 children>

*/
