/* See PEG.peg for the grammar */

IoPEG

PEGParser := IoPEG Parser clone do(
	pGrammar := method(
		seq( pSpacing, plus(pDefinition), pEndOfFile ) do(
			name := "Grammar"
		)
	)
	pDefinition := method(
		seq( pIdentifier, pLEFTARROW, pExpression ) do(
			name := "Definition"
		)
	)
	pExpression := method(
		seq( plus( pPrimary ), star( seq( pSLASH, plus( pPrimary ) ) ) ) do(
			name := "Expression"
		)
	)
	pPrimary := method(
		seq(
			optional( choice( pAND, pNOT ) ) do( name := "Prefix" ),
			choice(
				seq( pIdentifier, forbid( pLEFTARROW ) ),
				seq( pOPEN, pExpression, pCLOSE ),
				pLiteral,
				pClass,
				pDOT
			) do ( name := "Primary" ),
			optional( choice( pQUESTION, pSTAR, pPLUS ) ) do( name := "Suffix" )
		) do (
			name := "Sequence"
		)
	)
	pIdentifier := method(
		seq( regex( "[a-zA-Z_]\\w*" ), pSpacing ) ?collapse do( name := "Identifier" )
	)

	pLiteral := method(
		choice(
			seq(
				str( "'" ),
				star( seq( forbid( str("'") ), pChar) ),
				str( "'" ),
				pSpacing
			),
			seq(
				str( "\"" ),
				star( seq( forbid( str("\"") ), pChar ) ),
				str( "\"" ),
				pSpacing
			)
		) do (
			name := "Literal"
		)
	)
	pClass := method(
		seq(
			str( "[" ),
			star( seq(
				forbid( str("]") ),
				pRange
			) ),
			str( "]" ),
			pSpacing
		) do (
			name := "Class"
		)
	)
	pRange := method(
		choice(
			seq( pChar, str( "-" ), pChar ),
			pChar
		) do (
			name := "Range"
		)
	)
	pChar := method(
		choice(      
			regex( "\\\\(?:[nrt'\"\\[\\]\\\\]|[0-2][0-7]{2}|[0-7]{1,2})" ),
			seq( forbid( str( "\\" ) ), any )
		)
	)
	pLEFTARROW := method( seq( str( "<-" ), pSpacing ) ?collapse do( name := "LeftArrow" ) )
	pSLASH     := method( seq( str( "/"  ), pSpacing ) )
	pAND       := method( seq( str( "&"  ), pSpacing ) )
	pNOT       := method( seq( str( "!"  ), pSpacing ) )
	pQUESTION  := method( seq( str( "?"  ), pSpacing ) )
	pSTAR      := method( seq( str( "*"  ), pSpacing ) )
	pPLUS      := method( seq( str( "+"  ), pSpacing ) )
	pOPEN      := method( seq( str( "("  ), pSpacing ) )
	pCLOSE     := method( seq( str( ")"  ), pSpacing ) )
	pDOT       := method( seq( str( "."  ), pSpacing ) )
	pSpacing := method(
		star( choice( pSpace, pComment ) ) and true
	)
	pComment := method(
		seq(
			regex("#.+"),
			pEndOfLine
		)
	)
	pSpace := method(
		regex( "([ \\t]|\\r\\n|[\\n\\r])+" )
	)
	pEndOfLine := method(
		regex( "\\r\\n|[\\n\\r]" )
	)
	pEndOfFile := method( forbid(any) )

	parseRootProduction := getSlot( "pGrammar" )
)
