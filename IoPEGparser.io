/* See IoPEG.peg for the grammar */

IoPEG

IoPEGParser := IoPEG Parser clone do(
  pGrammar := method(
    seq(
      pSpacing,
      plus(pDefinition) hoist,
      pEndOfFile
    ) do( type := "Grammar" )
  )
  pDefinition := method(
    seq( pIdentifier do( type := "Production" ), pLEFTARROW, pExpression ) do(
      type := "Definition"
    )
  )
  pExpression := method(
    seq(
      plus( pPrimary ) do( type := "Sequence" ),
      star(
        seq( pSLASH, plus( pPrimary ) ) hoist do( type := "Sequence" )
      ) hoist
    ) do( type := "Expression" )
  )
  pPrimary := method(
    seq(
      optional( choice( pAND, pNOT ) ) do( type := "Prefix" ),
      choice(
        seq( pIdentifier, forbid( pLEFTARROW ) ) do(
          type := "NonTerminal"
          collapse
        ),
        seq( pOPEN, pExpression, pCLOSE ) do( type := "Group" ),
        pLiteral,
        pClass,
        pDOT
      ),
      optional( choice( pQUESTION, pSTAR, pPLUS ) ) do( type := "Suffix" )
    ) do( type := "Primary" )
  )
  pIdentifier := method(
    seq( regex("[a-zA-Z_]\\w*"), pSpacing ) collapse do( type := "Identifier" )
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
    ) do (
      type := "LITERAL"
      collapse
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
    seq( str("<-"), pSpacing ) collapse do( type := "LeftArrow" ) ignore
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
