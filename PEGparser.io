/* See PEG.peg for the grammar */

IoPEG

PEGParser := IoPEG Parser clone do(
  pGrammar := method(
    seq( pSpacing, plus(pDefinition), pEndOfFile )
  )
  pDefinition := method(
    seq( pIdentifier, pLEFTARROW, pExpression )
  )
  pExpression := method(
    seq( pSequence, star( seq( pSLASH, pSequence ) ) )
  )
  pSequence := method(
    star( pPrefix )
  )
  pPrefix := method(
    seq(
      optional( choice( pAND, pNOT ) ),
      pSuffix
    )
  )
  pSuffix := method(
    seq(
      pPrimary,
      optional( choice( pQUESTION, pSTAR, pPLUS ) )
    )
  )
  pPrimary := method(
    choice(
      seq( pIdentifier, forbid( pLEFTARROW ) ),
      seq( pOPEN, pExpression, pCLOSE ),
      pLiteral,
      pClass,
      pDOT
    )
  )
  pIdentifier := method(
    seq( pIdentStart, star(pIdentCont), pSpacing )
  )
  pIdentStart := method(
    regex( "[a-zA-Z_]" )
  )
  pIdentCont := method(
    choice( pIdentStart, regex( "[0-9]" ) )
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
    )
  )
  pRange := method(
    choice(
      seq( pChar, str( "-" ), pChar ),
      pChar
    )  
  )
  pChar := method(
    choice(
      seq( str( "\\" ), regex( "[nrt'\"\\[\\]\\\\]" ) ),
      seq( str( "\\" ), regex( "[0-2]" ), regex( "[0-7]" ), regex( "[0-7]" ) ),
      seq( str( "\\" ), regex( "[0-7]" ), optional( regex( "[0-7]" ) ) ),
      seq( forbid( str( "\\" ) ), any )
    )
  )
  pLEFTARROW := method( seq( str( "<-" ), pSpacing ) )
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
    star( choice( pSpace, pComment ) )
  )
  pComment := method(
    seq(
      str("#"),
      star(
        seq( forbid(pEndOfLine), any )
      )
      pEndOfLine
    )
  )
  pSpace := method(
    choice(
      str(" "),
      str("\t"),
      pEndOfLine
    )
  )
  pEndOfLine := method(
    choice(
      str("\r\n"),
      str("\n"),
      str("\r")
    )
  )
  pEndOfFile := method( forbid(any) )

  parseRootProduction := getSlot( "pGrammar" )
)
