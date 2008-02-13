/* See PEG.peg for the grammar */

IoPEG

PEGParser := IoPEG Parser clone do(
  pGrammar := method(
    parse_Sequence( pSpacing, oneOrMore(pDefinition), pEndOfFile )
  )
  pDefinition := method(
    parse_Sequence( pIdentifier, pLEFTARROW, pExpression )
  )
  pExpression := method(
    parse_Sequence( pSequence, zeroOrMore( pSLASH, pSequence ) )
  )
  pSequence := method(
    zeroOrMore( pPrefix )
  )
  pPrefix := method(
    parse_Sequence(
      zeroOrOne( parse_OrderedChoice( pAND, pNOT ) ),
      pSuffix
    )
  )
  pSuffix := method(
    parse_Sequence(
      pPrimary,
      zeroOrOne( parse_OrderedChoice( pQUESTION, pSTAR, pPLUS ) )
    )
  )
  pPrimary := method(
    parse_OrderedChoice(
      parse_Sequence( pIdentifier, forbid( pLEFTARROW ) ),
      parse_Sequence( pOPEN, pExpression, pCLOSE ),
      pLiteral,
      pClass,
      pDOT
    )
  )
  pIdentifier := method(
    parse_Sequence( pIdentStart, zeroOrMore(pIdentCont), pSpacing )
  )
  pIdentStart := method(
    parse_Regexp( "[a-zA-Z_]" )
  )
  pIdentCont := method(
    parse_OrderedChoice( pIdentStart, parse_Regexp( "[0-9]" ) )
  )
  pLiteral := method(
    parse_OrderedChoice(
      parse_Sequence(
        parse_Literal( "'" ),
        zeroOrMore( parse_Sequence(
          forbid( parse_Literal("'") ),
          pChar
        ) ),
        parse_Literal( "'" ),
        pSpacing
      ),
      parse_Sequence(
        parse_Literal( "\"" ),
        zeroOrMore( parse_Sequence(
          forbid( parse_Literal("\"") ),
          pChar
        ) ),
        parse_Literal( "\"" ),
        pSpacing
      )
    )
  )
  pClass := method(
    parse_Sequence(
      parse_Literal( "[" ),
      zeroOrMore( parse_Sequence(
        forbid( parse_Literal("]") ),
        pRange
      ) ),
      parse_Literal( "]" ),
      pSpacing
    )
  )
  pRange := method(
    parse_OrderedChoice(
      parse_Sequence( pChar, parse_Literal( "-" ), pChar ),
      pChar
    )  
  )
  pChar := method(
    parse_OrderedChoice(
      parse_Sequence( parse_Literal( "\\" ), parse_Regexp( "[nrt'\"\[\]\\]" ) ),
      parse_Sequence( parse_Literal( "\\" ), parse_Regexp( "[0-2]" ), parse_Regexp( "[0-7]" ), parse_Regexp( "[0-7]" ) ),
      parse_Sequence( parse_Literal( "\\" ), parse_Regexp( "[0-7]" ), zeroOrOne( parse_Regexp( "[0-7]" ) ) ),
      parse_Sequence( forbid( parse_Literal( "\\" ) ), parse_AnyChar )
    )
  )
  pLEFTARROW := method( parse_Sequence( parse_Literal( "<-" ), pSpacing ) )
  pSLASH := method( parse_Sequence( parse_Literal( "/" ), pSpacing ) )
  pAND := method( parse_Sequence( parse_Literal( "&" ), pSpacing ) )
  pNOT := method( parse_Sequence( parse_Literal( "!" ), pSpacing ) )
  pQUESTION := method( parse_Sequence( parse_Literal( "?" ), pSpacing ) )
  pSTAR := method( parse_Sequence( parse_Literal( "*" ), pSpacing ) )
  pPLUS := method( parse_Sequence( parse_Literal( "+" ), pSpacing ) )
  pOPEN := method( parse_Sequence( parse_Literal( "(" ), pSpacing ) )
  pCLOSE := method( parse_Sequence( parse_Literal( ")" ), pSpacing ) )
  pDOT := method( parse_Sequence( parse_Literal( "." ), pSpacing ) )
  pSpacing := method(
    zeroOrMore( parse_OrderedChoice( pSpace, pComment ) )    
  )
  pComment := method(
    parse_Sequence(
      parse_Literal("#"),
      zeroOrMore( parse_Sequence(forbid(pEndOfLine), parse_AnyChar) )
      pEndOfLine
    )
  )
  pSpace := method(
    parse_OrderedChoice(
      parse_Literal(" "),
      parse_Literal("\t"),
      pEndOfLine
    )
  )
  pEndOfLine := method(
    parse_OrderedChoice(
      parse_Literal("\r\n"),
      parse_Literal("\n"),
      parse_Literal("\r")
    )
  )
  pEndOfFile := method( forbid(parse_AnyChar) )

  parseRootProduction := getSlot( "pGrammar" )
)
