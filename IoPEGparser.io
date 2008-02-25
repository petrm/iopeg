/* See IoPEG.peg for the grammar */

IoPEGParser := IoPEG Parser clone do(
	Sequence := SyntaxNode clone do(
		type := "Sequence"
		asCode := method(
			if( children size == 1,
				children first asCode
			,
				"seq( #{children map( asCode ) join( \", \" ) } )" interpolate
			)
		)
	)
	Identifier := SyntaxNode clone do(
		type := "Identifier"
		asCode := method(
			"parse_#{text}" interpolate
		)		
	)
	pGrammar := method(
		seq(
			pSpacing,
			plus(pDefinition) hoist,
			pEndOfFile
		) do(
			type := "Grammar"
			asCode := method(
				# First identifier in the first expression
				firstIdentifier := children first children first
				code := firstIdentifier text asCapitalized .. "Parser := IoPEG Parser clone do(\n"
				code = code .. childrenWithType( "Definition" ) map( asCode ) join
				code = code .. "\tparseRootProduction := getSlot( \"" .. firstIdentifier asCode .. "\" )\n"
				code = code .. ")\n"
			)
		)
	)
	pDefinition := method(
		seq( pIdentifier, pLEFTARROW, pExpression ) do(
			type := "Definition"
			asCode := method(
				name := children first # Identifier
				expr := children last  # Expression
				"\t#{name asCode} := method( #{expr asCode} )\n" interpolate
			)
		)
	)
	pExpression := method(
		seq(
			plus( pPrimary ) prependProto( Sequence ),
			star(
				seq( pSLASH, plus( pPrimary ) ) hoist prependProto( Sequence )
			) hoist
		) do(
			type := "Expression"
			asCode := method(
				if( children size == 1,
					children first asCode
				,
					"choice( #{children map( asCode ) join( \", \" )} )" interpolate
				)
				
			)
		)
	)
	pPrimary := method(
		seq(
			optional( choice( pAND, pNOT ) ) do(
				type := "Prefix"
				asCode := method( content,
					if( text == "&",
						"ensure( #{content} )" interpolate
					,
						"forbid( #{content} )" interpolate
					)
				)
			),
			choice(
				seq( pIdentifier, forbid( pLEFTARROW ) ) collapse prependProto( Identifier ),
				seq( pOPEN, pExpression, pCLOSE ) do(
					type := "Group"
					asCode := method( children first asCode )
				),
				pLiteral,
				pClass,
				pDOT
			),
			optional( choice( pQUESTION, pSTAR, pPLUS ) ) do(
				type := "Suffix"
				asCode := method( zcontent,
					if( text == "?",
						"optional( #{zcontent} )" interpolate
					,
						if( text == "*",
							"star( #{zcontent} )" interpolate
						,
							"plus( #{zcontent} )" interpolate
						)
					)
				)
			)
		) do(
			type := "Primary"
			asCode := method(
				kids := children clone
				prefix := nil
				meat   := nil
				suffix := nil
				while( kids size > 0,
					kid := kids pop
					if( kid type == "Prefix",
						prefix = kid
					,
						if( kid type == "Suffix",
							suffix = kid
						,
							meat = kid
						)
					)
				)
				if( meat not, self showTree )
				code := meat asCode
				if( suffix, code = suffix asCode( code ) )
				if( prefix, code = prefix asCode( code ) )
				code
			)
		)
	)
	pIdentifier := method(
		seq( regex("[a-zA-Z_]\\w*"), pSpacing ) collapse prependProto( Identifier )
	)
	
	pLiteral := method(
		choice(
			seq(
				str("'") ignore,
				star( seq( forbid( str("'") ), pChar) ) collapse,
				str("'") ignore,
				pSpacing
			),
			seq(
				str("\"") ignore,
				star( seq( forbid( str("\"") ), pChar ) ) collapse,
				str("\"") ignore,
				pSpacing
			)
		) collapse do (
			type := "LITERAL"
			asCode := method(
				"str(\"#{text asMutable escape}\")" interpolate
			)
		)
	)
	pClass := method(
		seq(
			str("[") ignore,
			star( seq(
				forbid( str("]") ),
				pRange
			) ),
			str("]") ignore,
			pSpacing
		) collapse do (
			type := "CLASS"
			asCode := method(
				"regex(\"[#{text}]\")" interpolate
			)
		)
	)
	pRange := method(
		choice(
			seq( pChar, str("-"), pChar ),
			pChar
		)
	)
	pChar := method(
		choice(      
			regex("\\\\(?:[nrt'\"\\[\\]\\\\]|[0-2][0-7]{2}|[0-7]{1,2})"),
			seq( forbid( str("\\") ), any )
		)
	)
	pLEFTARROW := method(
		seq( str("<-"), pSpacing ) ignore
	)
	pSLASH     := method( seq( str("/"), pSpacing ) ignore )
	pAND       := method( seq( str("&"), pSpacing ) collapse )
	pNOT       := method( seq( str("!"), pSpacing ) collapse )
	pQUESTION  := method( seq( str("?"), pSpacing ) collapse )
	pSTAR      := method( seq( str("*"), pSpacing ) collapse )
	pPLUS      := method( seq( str("+"), pSpacing ) collapse )
	pOPEN      := method( seq( str("("), pSpacing ) ignore )
	pCLOSE     := method( seq( str(")"), pSpacing ) ignore )
	pDOT       := method( seq( str("."), pSpacing ) collapse do( type := "ANY" ) )
	pSpacing := method(
		star( choice( pSpace, pComment ) ) ignore
	)
	pComment := method(
		seq(
			regex("#.+"),
			pEndOfLine
		)
	)
	pSpace := method(
		regex("([ \\t]|\\r\\n|[\\n\\r])+")
	)
	pEndOfLine := method(
		regex("\\r\\n|[\\n\\r]")
	)
	pEndOfFile := method( forbid(any) )
	
	parseRootProduction := getSlot( "pGrammar" )
)
