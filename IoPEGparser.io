/* See IoPEG.peg for the grammar */

IoPEG

IoPEGParser := IoPEG Parser clone do(
  pGrammar := method(
    seq(
      pSpacing,
      plus(pDefinition) hoist,
      pEndOfFile
    ) do( name := "Grammar" )
  )
  pDefinition := method(
    seq( pIdentifier do( name := "Production" ), pLEFTARROW, pExpression ) do(
      name := "Definition"
    )
  )
  pExpression := method(
    seq(
      plus( pPrimary ) do( name := "Sequence" ),
      star(
        seq( pSLASH, plus( pPrimary ) ) hoist do( name := "Sequence" )
      ) do( name := "Alternatives" )
    ) do( name := "Expression" )
  )
  pPrimary := method(
    seq(
      optional( choice( pAND, pNOT ) ) do( name := "Prefix" ),
      choice(
        seq( pIdentifier, forbid( pLEFTARROW ) ) do(
          name := "NonTerminal"
          collapse
        ),
        seq( pOPEN, pExpression, pCLOSE ) do( name := "Group" ),
        pLiteral,
        pClass,
        pDOT
      ),
      optional( choice( pQUESTION, pSTAR, pPLUS ) ) do( name := "Suffix" )
    ) do( name := "Primary" )
  )
  pIdentifier := method(
    seq( regex("[a-zA-Z_]\\w*"), pSpacing ) collapse do( name := "Identifier" )
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
      name := "Literal"
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
      name := "Class"
    )
  )
  pRange := method(
    choice(
      seq( pChar, str("-"), pChar ),
      pChar
    ) do (
      name := "Range"
    )
  )
  pChar := method(
    choice(      
      regex("\\\\(?:[nrt'\"\\[\\]\\\\]|[0-2][0-7]{2}|[0-7]{1,2})"),
      seq( forbid( str("\\") ), any )
    )
  )
  pLEFTARROW := method(
    seq( str("<-"), pSpacing ) collapse do( name := "LeftArrow" ) ignore
  )
  pSLASH     := method( seq( str("/"), pSpacing ) ignore )
  pAND       := method( seq( str("&"), pSpacing ) collapse do( name := "Ensure" ) )
  pNOT       := method( seq( str("!"), pSpacing ) collapse do( name := "Forbid" ) )
  pQUESTION  := method( seq( str("?"), pSpacing ) collapse do( name := "ZeroOrOne" ) )
  pSTAR      := method( seq( str("*"), pSpacing ) collapse do( repeat := "ZeroOrMore" ) )
  pPLUS      := method( seq( str("+"), pSpacing ) collapse do( repeat := "OneOrMore" ) )
  pOPEN      := method( seq( str("("), pSpacing ) ignore )
  pCLOSE     := method( seq( str(")"), pSpacing ) ignore )
  pDOT       := method( seq( str("."), pSpacing ) collapse do( name := "ANY" ) )
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
