PEGParser

TestPEGParser := UnitTest clone do(  
  test1_parsing := method(
    assertParses( File with( "PEG.peg" ) contents )
  )
  
  assertParses := method( str,
    assertNotNil( PEGParser parse( str ) )
  )
  
  assertParseFailure := method( str,
    assertRaisesException( PEGParser parse( str ) )
  )
)
# TestPEGParser run

PEGParser parse( File with( "PEG.peg" ) contents ) showTree
/*
<Grammar 'Grammar    <- Spacing Definition+ EndOfFile\nDefinition <- Identifier LEFTARROW Expression\nExpression <- Sequence (SLASH Sequence)*\nSequence   <- Prefix*\nPrefix     <- (AND / NOT)? Suffix\nSuffix     <- Primary (QUESTION / STAR / PLUS)?\nPrimary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\nIdentifier <- IdentStart IdentCont* Spacing\nIdentStart <- [a-zA-Z_]\nIdentCont  <- IdentStart / [0-9]\nLiteral    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\nClass      <- '[' (!']' Range)* ']' Spacing\nRange      <- Char '-' Char / Char\nChar       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\nLEFTARROW  <- '<-' Spacing\nSLASH      <- '/' Spacing\nAND        <- '&' Spacing\nNOT        <- '!' Spacing\nQUESTION   <- '?' Spacing\nSTAR       <- '*' Spacing\nPLUS       <- '+' Spacing\nOPEN       <- '(' Spacing\nCLOSE      <- ')' Spacing\nDOT        <- '.' Spacing\nSpacing    <- (Space / Comment)*\nComment    <- '#' (!EndOfLine .)* EndOfLine\nSpace      <- ' ' / '\\t' / EndOfLine\nEndOfLine  <- '\\r\\n' / '\\n' / '\\r'\nEndOfFile  <- !.' 1 children>
  <SyntaxNode_0x3d8630 'Grammar    <- Spacing Definition+ EndOfFile\nDefinition <- Identifier LEFTARROW Expression\nExpression <- Sequence (SLASH Sequence)*\nSequence   <- Prefix*\nPrefix     <- (AND / NOT)? Suffix\nSuffix     <- Primary (QUESTION / STAR / PLUS)?\nPrimary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT\n\n# Lexical syntax\nIdentifier <- IdentStart IdentCont* Spacing\nIdentStart <- [a-zA-Z_]\nIdentCont  <- IdentStart / [0-9]\nLiteral    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing\n\nClass      <- '[' (!']' Range)* ']' Spacing\nRange      <- Char '-' Char / Char\nChar       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .\nLEFTARROW  <- '<-' Spacing\nSLASH      <- '/' Spacing\nAND        <- '&' Spacing\nNOT        <- '!' Spacing\nQUESTION   <- '?' Spacing\nSTAR       <- '*' Spacing\nPLUS       <- '+' Spacing\nOPEN       <- '(' Spacing\nCLOSE      <- ')' Spacing\nDOT        <- '.' Spacing\nSpacing    <- (Space / Comment)*\nComment    <- '#' (!EndOfLine .)* EndOfLine\nSpace      <- ' ' / '\\t' / EndOfLine\nEndOfLine  <- '\\r\\n' / '\\n' / '\\r'\nEndOfFile  <- !.' 29 children>
    <Definition 'Grammar    <- Spacing Definition+ EndOfFile' 3 children>
      <Identifier 'Grammar' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Spacing Definition+ EndOfFile' 1 children>
        <SyntaxNode_0x3cef20 'Spacing Definition+ EndOfFile' 3 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
          <Sequence 'Definition+' 2 children>
            <Primary 'Definition' 1 children>
              <Identifier 'Definition' 0 children>
            <Suffix '+' 1 children>
              <SyntaxNode_0x3b57a0 '+' 0 children>
          <Sequence 'EndOfFile' 1 children>
            <Primary 'EndOfFile' 1 children>
              <Identifier 'EndOfFile' 0 children>
    <Definition 'Definition <- Identifier LEFTARROW Expression' 3 children>
      <Identifier 'Definition' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Identifier LEFTARROW Expression' 1 children>
        <SyntaxNode_0x3d4ca0 'Identifier LEFTARROW Expression' 3 children>
          <Sequence 'Identifier' 1 children>
            <Primary 'Identifier' 1 children>
              <Identifier 'Identifier' 0 children>
          <Sequence 'LEFTARROW' 1 children>
            <Primary 'LEFTARROW' 1 children>
              <Identifier 'LEFTARROW' 0 children>
          <Sequence 'Expression' 1 children>
            <Primary 'Expression' 1 children>
              <Identifier 'Expression' 0 children>
    <Definition 'Expression <- Sequence (SLASH Sequence)*' 3 children>
      <Identifier 'Expression' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Sequence (SLASH Sequence)*' 1 children>
        <SyntaxNode_0x3bf2d0 'Sequence (SLASH Sequence)*' 2 children>
          <Sequence 'Sequence' 1 children>
            <Primary 'Sequence' 1 children>
              <Identifier 'Sequence' 0 children>
          <Sequence '(SLASH Sequence)*' 2 children>
            <Primary '(SLASH Sequence)' 3 children>
              <SyntaxNode_0x3acde0 '(' 1 children>
                <SyntaxNode_0x3b9a90 '(' 0 children>
              <Expression 'SLASH Sequence' 1 children>
                <SyntaxNode_0x3cfee0 'SLASH Sequence' 2 children>
                  <Sequence 'SLASH' 1 children>
                    <Primary 'SLASH' 1 children>
                      <Identifier 'SLASH' 0 children>
                  <Sequence 'Sequence' 1 children>
                    <Primary 'Sequence' 1 children>
                      <Identifier 'Sequence' 0 children>
              <SyntaxNode_0x2de2a0 ')' 1 children>
                <SyntaxNode_0x3b44e0 ')' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x353400 '*' 0 children>
    <Definition 'Sequence   <- Prefix*' 3 children>
      <Identifier 'Sequence' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Prefix*' 1 children>
        <SyntaxNode_0x3c8c80 'Prefix*' 1 children>
          <Sequence 'Prefix*' 2 children>
            <Primary 'Prefix' 1 children>
              <Identifier 'Prefix' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x3de120 '*' 0 children>
    <Definition 'Prefix     <- (AND / NOT)? Suffix' 3 children>
      <Identifier 'Prefix' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '(AND / NOT)? Suffix' 1 children>
        <SyntaxNode_0x3d7f70 '(AND / NOT)? Suffix' 2 children>
          <Sequence '(AND / NOT)?' 2 children>
            <Primary '(AND / NOT)' 3 children>
              <SyntaxNode_0x324610 '(' 1 children>
                <SyntaxNode_0x3beea0 '(' 0 children>
              <Expression 'AND / NOT' 2 children>
                <SyntaxNode_0x3c22d0 'AND' 1 children>
                  <Sequence 'AND' 1 children>
                    <Primary 'AND' 1 children>
                      <Identifier 'AND' 0 children>
                <SyntaxNode_0x3cc760 '/ NOT' 1 children>
                  <SyntaxNode_0x3e0150 '/ NOT' 2 children>
                    <SyntaxNode_0x3ddbc0 '/' 1 children>
                      <SyntaxNode_0x3bcd10 '/' 0 children>
                    <SyntaxNode_0x3b9870 'NOT' 1 children>
                      <Sequence 'NOT' 1 children>
                        <Primary 'NOT' 1 children>
                          <Identifier 'NOT' 0 children>
              <SyntaxNode_0x3e4870 ')' 1 children>
                <SyntaxNode_0x3ae250 ')' 0 children>
            <Suffix '?' 1 children>
              <SyntaxNode_0x3c5240 '?' 0 children>
          <Sequence 'Suffix' 1 children>
            <Primary 'Suffix' 1 children>
              <Identifier 'Suffix' 0 children>
    <Definition 'Suffix     <- Primary (QUESTION / STAR / PLUS)?' 3 children>
      <Identifier 'Suffix' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Primary (QUESTION / STAR / PLUS)?' 1 children>
        <SyntaxNode_0x3b71f0 'Primary (QUESTION / STAR / PLUS)?' 2 children>
          <Sequence 'Primary' 1 children>
            <Primary 'Primary' 1 children>
              <Identifier 'Primary' 0 children>
          <Sequence '(QUESTION / STAR / PLUS)?' 2 children>
            <Primary '(QUESTION / STAR / PLUS)' 3 children>
              <SyntaxNode_0x3da700 '(' 1 children>
                <SyntaxNode_0x394ad0 '(' 0 children>
              <Expression 'QUESTION / STAR / PLUS' 2 children>
                <SyntaxNode_0x3c2ca0 'QUESTION' 1 children>
                  <Sequence 'QUESTION' 1 children>
                    <Primary 'QUESTION' 1 children>
                      <Identifier 'QUESTION' 0 children>
                <SyntaxNode_0x331780 '/ STAR / PLUS' 2 children>
                  <SyntaxNode_0x3aa100 '/ STAR' 2 children>
                    <SyntaxNode_0x3bf2d0 '/' 1 children>
                      <SyntaxNode_0x3dcde0 '/' 0 children>
                    <SyntaxNode_0x3e0020 'STAR' 1 children>
                      <Sequence 'STAR' 1 children>
                        <Primary 'STAR' 1 children>
                          <Identifier 'STAR' 0 children>
                  <SyntaxNode_0x2d9c70 '/ PLUS' 2 children>
                    <SyntaxNode_0x3dfc50 '/' 1 children>
                      <SyntaxNode_0x3e1bf0 '/' 0 children>
                    <SyntaxNode_0x396960 'PLUS' 1 children>
                      <Sequence 'PLUS' 1 children>
                        <Primary 'PLUS' 1 children>
                          <Identifier 'PLUS' 0 children>
              <SyntaxNode_0x3de450 ')' 1 children>
                <SyntaxNode_0x315a00 ')' 0 children>
            <Suffix '?' 1 children>
              <SyntaxNode_0x2827a0 '?' 0 children>
    <Definition 'Primary    <- Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT' 3 children>
      <Identifier 'Primary' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Identifier !LEFTARROW\n              / OPEN Expression CLOSE\n              / Literal / Class / DOT' 2 children>
        <SyntaxNode_0x3d5ce0 'Identifier !LEFTARROW' 2 children>
          <Sequence 'Identifier' 1 children>
            <Primary 'Identifier' 1 children>
              <Identifier 'Identifier' 0 children>
          <Sequence '!LEFTARROW' 2 children>
            <Prefix '!' 1 children>
              <SyntaxNode_0x307400 '!' 0 children>
            <Primary 'LEFTARROW' 1 children>
              <Identifier 'LEFTARROW' 0 children>
        <SyntaxNode_0x3cb8e0 '/ OPEN Expression CLOSE\n              / Literal / Class / DOT' 4 children>
          <SyntaxNode_0x3dfca0 '/ OPEN Expression CLOSE' 2 children>
            <SyntaxNode_0x3db340 '/' 1 children>
              <SyntaxNode_0x2d4190 '/' 0 children>
            <SyntaxNode_0x397a30 'OPEN Expression CLOSE' 3 children>
              <Sequence 'OPEN' 1 children>
                <Primary 'OPEN' 1 children>
                  <Identifier 'OPEN' 0 children>
              <Sequence 'Expression' 1 children>
                <Primary 'Expression' 1 children>
                  <Identifier 'Expression' 0 children>
              <Sequence 'CLOSE' 1 children>
                <Primary 'CLOSE' 1 children>
                  <Identifier 'CLOSE' 0 children>
          <SyntaxNode_0x3daa40 '/ Literal' 2 children>
            <SyntaxNode_0x3e0a90 '/' 1 children>
              <SyntaxNode_0x3cfee0 '/' 0 children>
            <SyntaxNode_0x3a24d0 'Literal' 1 children>
              <Sequence 'Literal' 1 children>
                <Primary 'Literal' 1 children>
                  <Identifier 'Literal' 0 children>
          <SyntaxNode_0x3cd160 '/ Class' 2 children>
            <SyntaxNode_0x3cd680 '/' 1 children>
              <SyntaxNode_0x3a8eb0 '/' 0 children>
            <SyntaxNode_0x3ce940 'Class' 1 children>
              <Sequence 'Class' 1 children>
                <Primary 'Class' 1 children>
                  <Identifier 'Class' 0 children>
          <SyntaxNode_0x3dfbf0 '/ DOT' 2 children>
            <SyntaxNode_0x3e4650 '/' 1 children>
              <SyntaxNode_0x3af410 '/' 0 children>
            <SyntaxNode_0x393430 'DOT' 1 children>
              <Sequence 'DOT' 1 children>
                <Primary 'DOT' 1 children>
                  <Identifier 'DOT' 0 children>
    <Definition 'Identifier <- IdentStart IdentCont* Spacing' 3 children>
      <Identifier 'Identifier' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'IdentStart IdentCont* Spacing' 1 children>
        <SyntaxNode_0x3280b0 'IdentStart IdentCont* Spacing' 3 children>
          <Sequence 'IdentStart' 1 children>
            <Primary 'IdentStart' 1 children>
              <Identifier 'IdentStart' 0 children>
          <Sequence 'IdentCont*' 2 children>
            <Primary 'IdentCont' 1 children>
              <Identifier 'IdentCont' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x2dc3f0 '*' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'IdentStart <- [a-zA-Z_]' 3 children>
      <Identifier 'IdentStart' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '[a-zA-Z_]' 1 children>
        <SyntaxNode_0x2684d0 '[a-zA-Z_]' 1 children>
          <Sequence '[a-zA-Z_]' 1 children>
            <Primary '[a-zA-Z_]' 3 children>
              <SyntaxNode_0x3bb880 '[' 0 children>
              <SyntaxNode_0x3d15a0 'a-zA-Z_' 3 children>
                <SyntaxNode_0x3abc60 'a-z' 1 children>
                  <Range 'a-z' 3 children>
                    <SyntaxNode_0x3d1020 'a' 1 children>
                      <SyntaxNode_0x3dd2d0 'a' 0 children>
                    <SyntaxNode_0x3c3010 '-' 0 children>
                    <SyntaxNode_0x3a26a0 'z' 1 children>
                      <SyntaxNode_0x3c1c20 'z' 0 children>
                <SyntaxNode_0x3e3bd0 'A-Z' 1 children>
                  <Range 'A-Z' 3 children>
                    <SyntaxNode_0x3af0b0 'A' 1 children>
                      <SyntaxNode_0x317790 'A' 0 children>
                    <SyntaxNode_0x3ad680 '-' 0 children>
                    <SyntaxNode_0x35c8f0 'Z' 1 children>
                      <SyntaxNode_0x3d9c10 'Z' 0 children>
                <SyntaxNode_0x3d1620 '_' 1 children>
                  <Range '_' 1 children>
                    <SyntaxNode_0x3b47b0 '_' 0 children>
              <SyntaxNode_0x3c94a0 ']' 0 children>
    <Definition 'IdentCont  <- IdentStart / [0-9]' 3 children>
      <Identifier 'IdentCont' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'IdentStart / [0-9]' 2 children>
        <SyntaxNode_0x3dfdf0 'IdentStart' 1 children>
          <Sequence 'IdentStart' 1 children>
            <Primary 'IdentStart' 1 children>
              <Identifier 'IdentStart' 0 children>
        <SyntaxNode_0x3a0020 '/ [0-9]' 1 children>
          <SyntaxNode_0x3c2e70 '/ [0-9]' 2 children>
            <SyntaxNode_0x3861d0 '/' 1 children>
              <SyntaxNode_0x3a3f30 '/' 0 children>
            <SyntaxNode_0x391930 '[0-9]' 1 children>
              <Sequence '[0-9]' 1 children>
                <Primary '[0-9]' 3 children>
                  <SyntaxNode_0x3ced00 '[' 0 children>
                  <SyntaxNode_0x3dfb90 '0-9' 1 children>
                    <SyntaxNode_0x3b4940 '0-9' 1 children>
                      <Range '0-9' 3 children>
                        <SyntaxNode_0x3cce60 '0' 1 children>
                          <SyntaxNode_0x3c7170 '0' 0 children>
                        <SyntaxNode_0x3d6f90 '-' 0 children>
                        <SyntaxNode_0x3b87b0 '9' 1 children>
                          <SyntaxNode_0x39b7b0 '9' 0 children>
                  <SyntaxNode_0x3930b0 ']' 0 children>
    <Definition 'Literal    <- ['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing' 3 children>
      <Identifier 'Literal' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '['] (!['] Char)* ['] Spacing\n              / [\"] (![\"] Char)* [\"] Spacing' 2 children>
        <SyntaxNode_0x3c2490 '['] (!['] Char)* ['] Spacing' 4 children>
          <Sequence '[']' 1 children>
            <Primary '[']' 3 children>
              <SyntaxNode_0x3d57f0 '[' 0 children>
              <SyntaxNode_0x3dae60 ''' 1 children>
                <SyntaxNode_0x391c30 ''' 1 children>
                  <Range ''' 1 children>
                    <SyntaxNode_0x3b0730 ''' 0 children>
              <SyntaxNode_0x3d4ee0 ']' 0 children>
          <Sequence '(!['] Char)*' 2 children>
            <Primary '(!['] Char)' 3 children>
              <SyntaxNode_0x288760 '(' 1 children>
                <SyntaxNode_0x3c52b0 '(' 0 children>
              <Expression '!['] Char' 1 children>
                <SyntaxNode_0x3e7d20 '!['] Char' 2 children>
                  <Sequence '![']' 2 children>
                    <Prefix '!' 1 children>
                      <SyntaxNode_0x3a6de0 '!' 0 children>
                    <Primary '[']' 3 children>
                      <SyntaxNode_0x263840 '[' 0 children>
                      <SyntaxNode_0x3a4550 ''' 1 children>
                        <SyntaxNode_0x2ab0d0 ''' 1 children>
                          <Range ''' 1 children>
                            <SyntaxNode_0x33efb0 ''' 0 children>
                      <SyntaxNode_0x3d0e60 ']' 0 children>
                  <Sequence 'Char' 1 children>
                    <Primary 'Char' 1 children>
                      <Identifier 'Char' 0 children>
              <SyntaxNode_0x3834b0 ')' 1 children>
                <SyntaxNode_0x3b0a10 ')' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x3d4cc0 '*' 0 children>
          <Sequence '[']' 1 children>
            <Primary '[']' 3 children>
              <SyntaxNode_0x3c9ea0 '[' 0 children>
              <SyntaxNode_0x291210 ''' 1 children>
                <SyntaxNode_0x3a49a0 ''' 1 children>
                  <Range ''' 1 children>
                    <SyntaxNode_0x3b5770 ''' 0 children>
              <SyntaxNode_0x3dbd20 ']' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
        <SyntaxNode_0x2e7370 '/ [\"] (![\"] Char)* [\"] Spacing' 1 children>
          <SyntaxNode_0x3dfe60 '/ [\"] (![\"] Char)* [\"] Spacing' 2 children>
            <SyntaxNode_0x39f9e0 '/' 1 children>
              <SyntaxNode_0x3b3430 '/' 0 children>
            <SyntaxNode_0x250d80 '[\"] (![\"] Char)* [\"] Spacing' 4 children>
              <Sequence '[\"]' 1 children>
                <Primary '[\"]' 3 children>
                  <SyntaxNode_0x393430 '[' 0 children>
                  <SyntaxNode_0x3b8eb0 '\"' 1 children>
                    <SyntaxNode_0x3c6fd0 '\"' 1 children>
                      <Range '\"' 1 children>
                        <SyntaxNode_0x3be2f0 '\"' 0 children>
                  <SyntaxNode_0x3b4fb0 ']' 0 children>
              <Sequence '(![\"] Char)*' 2 children>
                <Primary '(![\"] Char)' 3 children>
                  <SyntaxNode_0x35d630 '(' 1 children>
                    <SyntaxNode_0x3dd2b0 '(' 0 children>
                  <Expression '![\"] Char' 1 children>
                    <SyntaxNode_0x3b3e30 '![\"] Char' 2 children>
                      <Sequence '![\"]' 2 children>
                        <Prefix '!' 1 children>
                          <SyntaxNode_0x3df3f0 '!' 0 children>
                        <Primary '[\"]' 3 children>
                          <SyntaxNode_0x3aaba0 '[' 0 children>
                          <SyntaxNode_0x3c0720 '\"' 1 children>
                            <SyntaxNode_0x3d0b90 '\"' 1 children>
                              <Range '\"' 1 children>
                                <SyntaxNode_0x3c1be0 '\"' 0 children>
                          <SyntaxNode_0x3cd330 ']' 0 children>
                      <Sequence 'Char' 1 children>
                        <Primary 'Char' 1 children>
                          <Identifier 'Char' 0 children>
                  <SyntaxNode_0x3d93f0 ')' 1 children>
                    <SyntaxNode_0x3a7ac0 ')' 0 children>
                <Suffix '*' 1 children>
                  <SyntaxNode_0x3d5e40 '*' 0 children>
              <Sequence '[\"]' 1 children>
                <Primary '[\"]' 3 children>
                  <SyntaxNode_0x3b3f70 '[' 0 children>
                  <SyntaxNode_0x39d7b0 '\"' 1 children>
                    <SyntaxNode_0x35a780 '\"' 1 children>
                      <Range '\"' 1 children>
                        <SyntaxNode_0x3dd760 '\"' 0 children>
                  <SyntaxNode_0x36e8b0 ']' 0 children>
              <Sequence 'Spacing' 1 children>
                <Primary 'Spacing' 1 children>
                  <Identifier 'Spacing' 0 children>
    <Definition 'Class      <- '[' (!']' Range)* ']' Spacing' 3 children>
      <Identifier 'Class' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''[' (!']' Range)* ']' Spacing' 1 children>
        <SyntaxNode_0x3d4360 ''[' (!']' Range)* ']' Spacing' 4 children>
          <Sequence ''['' 1 children>
            <Primary ''['' 3 children>
              <SyntaxNode_0x29ebe0 ''' 0 children>
              <SyntaxNode_0x3a6640 '[' 1 children>
                <SyntaxNode_0x3afbb0 '[' 1 children>
                  <SyntaxNode_0x3aa200 '[' 1 children>
                    <SyntaxNode_0x3c4440 '[' 0 children>
              <SyntaxNode_0x3d8960 ''' 0 children>
          <Sequence '(!']' Range)*' 2 children>
            <Primary '(!']' Range)' 3 children>
              <SyntaxNode_0x3da280 '(' 1 children>
                <SyntaxNode_0x3c65e0 '(' 0 children>
              <Expression '!']' Range' 1 children>
                <SyntaxNode_0x38e110 '!']' Range' 2 children>
                  <Sequence '!']'' 2 children>
                    <Prefix '!' 1 children>
                      <SyntaxNode_0x37c780 '!' 0 children>
                    <Primary '']'' 3 children>
                      <SyntaxNode_0x3deb20 ''' 0 children>
                      <SyntaxNode_0x3a3f30 ']' 1 children>
                        <SyntaxNode_0x3c4d50 ']' 1 children>
                          <SyntaxNode_0x341f20 ']' 1 children>
                            <SyntaxNode_0x3e5150 ']' 0 children>
                      <SyntaxNode_0x3e0970 ''' 0 children>
                  <Sequence 'Range' 1 children>
                    <Primary 'Range' 1 children>
                      <Identifier 'Range' 0 children>
              <SyntaxNode_0x3e8250 ')' 1 children>
                <SyntaxNode_0x3bca30 ')' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x3d6700 '*' 0 children>
          <Sequence '']'' 1 children>
            <Primary '']'' 3 children>
              <SyntaxNode_0x3b66a0 ''' 0 children>
              <SyntaxNode_0x366b60 ']' 1 children>
                <SyntaxNode_0x312a80 ']' 1 children>
                  <SyntaxNode_0x3d8580 ']' 1 children>
                    <SyntaxNode_0x269be0 ']' 0 children>
              <SyntaxNode_0x322b30 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'Range      <- Char '-' Char / Char' 3 children>
      <Identifier 'Range' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression 'Char '-' Char / Char' 2 children>
        <SyntaxNode_0x3d3dd0 'Char '-' Char' 3 children>
          <Sequence 'Char' 1 children>
            <Primary 'Char' 1 children>
              <Identifier 'Char' 0 children>
          <Sequence ''-'' 1 children>
            <Primary ''-'' 3 children>
              <SyntaxNode_0x2c58f0 ''' 0 children>
              <SyntaxNode_0x3beea0 '-' 1 children>
                <SyntaxNode_0x3c6230 '-' 1 children>
                  <SyntaxNode_0x3d8d60 '-' 1 children>
                    <SyntaxNode_0x3d36b0 '-' 0 children>
              <SyntaxNode_0x3ba500 ''' 0 children>
          <Sequence 'Char' 1 children>
            <Primary 'Char' 1 children>
              <Identifier 'Char' 0 children>
        <SyntaxNode_0x2545f0 '/ Char' 1 children>
          <SyntaxNode_0x398ad0 '/ Char' 2 children>
            <SyntaxNode_0x331870 '/' 1 children>
              <SyntaxNode_0x390c30 '/' 0 children>
            <SyntaxNode_0x344590 'Char' 1 children>
              <Sequence 'Char' 1 children>
                <Primary 'Char' 1 children>
                  <Identifier 'Char' 0 children>
    <Definition 'Char       <- '\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .' 3 children>
      <Identifier 'Char' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''\\\\' [nrt'\"\\[\\]\\\\]\n              / '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .' 2 children>
        <SyntaxNode_0x3a6cb0 ''\\\\' [nrt'\"\\[\\]\\\\]' 2 children>
          <Sequence ''\\\\'' 1 children>
            <Primary ''\\\\'' 3 children>
              <SyntaxNode_0x3a0980 ''' 0 children>
              <SyntaxNode_0x32c0c0 '\\\\' 1 children>
                <SyntaxNode_0x3dc6c0 '\\\\' 1 children>
                  <SyntaxNode_0x3d0090 '\\\\' 0 children>
              <SyntaxNode_0x3daa70 ''' 0 children>
          <Sequence '[nrt'\"\\[\\]\\\\]' 1 children>
            <Primary '[nrt'\"\\[\\]\\\\]' 3 children>
              <SyntaxNode_0x3e12d0 '[' 0 children>
              <SyntaxNode_0x229040 'nrt'\"\\[\\]\\\\' 8 children>
                <SyntaxNode_0x3c27c0 'n' 1 children>
                  <Range 'n' 1 children>
                    <SyntaxNode_0x3c7c10 'n' 0 children>
                <SyntaxNode_0x3ad620 'r' 1 children>
                  <Range 'r' 1 children>
                    <SyntaxNode_0x3d24f0 'r' 0 children>
                <SyntaxNode_0x3e3030 't' 1 children>
                  <Range 't' 1 children>
                    <SyntaxNode_0x397080 't' 0 children>
                <SyntaxNode_0x39c7b0 ''' 1 children>
                  <Range ''' 1 children>
                    <SyntaxNode_0x3c34d0 ''' 0 children>
                <SyntaxNode_0x394600 '\"' 1 children>
                  <Range '\"' 1 children>
                    <SyntaxNode_0x399520 '\"' 0 children>
                <SyntaxNode_0x3a71e0 '\\[' 1 children>
                  <Range '\\[' 0 children>
                <SyntaxNode_0x3a11a0 '\\]' 1 children>
                  <Range '\\]' 0 children>
                <SyntaxNode_0x3c4ad0 '\\\\' 1 children>
                  <Range '\\\\' 0 children>
              <SyntaxNode_0x3bb150 ']' 0 children>
        <SyntaxNode_0x2c16e0 '/ '\\\\' [0-2] [0-7] [0-7]\n              / '\\\\' [0-7] [0-7]?\n              / !'\\\\' .' 3 children>
          <SyntaxNode_0x3e51d0 '/ '\\\\' [0-2] [0-7] [0-7]' 2 children>
            <SyntaxNode_0x391930 '/' 1 children>
              <SyntaxNode_0x3b3540 '/' 0 children>
            <SyntaxNode_0x3d2c50 ''\\\\' [0-2] [0-7] [0-7]' 4 children>
              <Sequence ''\\\\'' 1 children>
                <Primary ''\\\\'' 3 children>
                  <SyntaxNode_0x26c010 ''' 0 children>
                  <SyntaxNode_0x39db60 '\\\\' 1 children>
                    <SyntaxNode_0x2d9cd0 '\\\\' 1 children>
                      <SyntaxNode_0x3c4440 '\\\\' 0 children>
                  <SyntaxNode_0x3df3a0 ''' 0 children>
              <Sequence '[0-2]' 1 children>
                <Primary '[0-2]' 3 children>
                  <SyntaxNode_0x3be490 '[' 0 children>
                  <SyntaxNode_0x3a3ff0 '0-2' 1 children>
                    <SyntaxNode_0x3ccdc0 '0-2' 1 children>
                      <Range '0-2' 3 children>
                        <SyntaxNode_0x3d3140 '0' 1 children>
                          <SyntaxNode_0x333a80 '0' 0 children>
                        <SyntaxNode_0x3a7530 '-' 0 children>
                        <SyntaxNode_0x3dad60 '2' 1 children>
                          <SyntaxNode_0x3e1470 '2' 0 children>
                  <SyntaxNode_0x3bab30 ']' 0 children>
              <Sequence '[0-7]' 1 children>
                <Primary '[0-7]' 3 children>
                  <SyntaxNode_0x3e82f0 '[' 0 children>
                  <SyntaxNode_0x3df230 '0-7' 1 children>
                    <SyntaxNode_0x3a5ce0 '0-7' 1 children>
                      <Range '0-7' 3 children>
                        <SyntaxNode_0x392f40 '0' 1 children>
                          <SyntaxNode_0x3ce390 '0' 0 children>
                        <SyntaxNode_0x3d7020 '-' 0 children>
                        <SyntaxNode_0x2e9ab0 '7' 1 children>
                          <SyntaxNode_0x39bcd0 '7' 0 children>
                  <SyntaxNode_0x3b4230 ']' 0 children>
              <Sequence '[0-7]' 1 children>
                <Primary '[0-7]' 3 children>
                  <SyntaxNode_0x3da920 '[' 0 children>
                  <SyntaxNode_0x392bb0 '0-7' 1 children>
                    <SyntaxNode_0x39cf80 '0-7' 1 children>
                      <Range '0-7' 3 children>
                        <SyntaxNode_0x3a0e50 '0' 1 children>
                          <SyntaxNode_0x3d2740 '0' 0 children>
                        <SyntaxNode_0x2f7480 '-' 0 children>
                        <SyntaxNode_0x3a8800 '7' 1 children>
                          <SyntaxNode_0x3a9d10 '7' 0 children>
                  <SyntaxNode_0x3dc900 ']' 0 children>
          <SyntaxNode_0x3cae40 '/ '\\\\' [0-7] [0-7]?' 2 children>
            <SyntaxNode_0x39fbe0 '/' 1 children>
              <SyntaxNode_0x3be190 '/' 0 children>
            <SyntaxNode_0x390b70 ''\\\\' [0-7] [0-7]?' 3 children>
              <Sequence ''\\\\'' 1 children>
                <Primary ''\\\\'' 3 children>
                  <SyntaxNode_0x3bf730 ''' 0 children>
                  <SyntaxNode_0x3bcd10 '\\\\' 1 children>
                    <SyntaxNode_0x3bff60 '\\\\' 1 children>
                      <SyntaxNode_0x3b6160 '\\\\' 0 children>
                  <SyntaxNode_0x39a690 ''' 0 children>
              <Sequence '[0-7]' 1 children>
                <Primary '[0-7]' 3 children>
                  <SyntaxNode_0x3c4400 '[' 0 children>
                  <SyntaxNode_0x3c0f90 '0-7' 1 children>
                    <SyntaxNode_0x3dc4c0 '0-7' 1 children>
                      <Range '0-7' 3 children>
                        <SyntaxNode_0x3b09d0 '0' 1 children>
                          <SyntaxNode_0x391d10 '0' 0 children>
                        <SyntaxNode_0x3c8dc0 '-' 0 children>
                        <SyntaxNode_0x3dcac0 '7' 1 children>
                          <SyntaxNode_0x3ccda0 '7' 0 children>
                  <SyntaxNode_0x3e4830 ']' 0 children>
              <Sequence '[0-7]?' 2 children>
                <Primary '[0-7]' 3 children>
                  <SyntaxNode_0x3a1250 '[' 0 children>
                  <SyntaxNode_0x3ca2c0 '0-7' 1 children>
                    <SyntaxNode_0x3bf200 '0-7' 1 children>
                      <Range '0-7' 3 children>
                        <SyntaxNode_0x395fe0 '0' 1 children>
                          <SyntaxNode_0x3bf2d0 '0' 0 children>
                        <SyntaxNode_0x395a90 '-' 0 children>
                        <SyntaxNode_0x3bbec0 '7' 1 children>
                          <SyntaxNode_0x3db4f0 '7' 0 children>
                  <SyntaxNode_0x3d2d00 ']' 0 children>
                <Suffix '?' 1 children>
                  <SyntaxNode_0x3d1fe0 '?' 0 children>
          <SyntaxNode_0x3cdd80 '/ !'\\\\' .' 2 children>
            <SyntaxNode_0x3de440 '/' 1 children>
              <SyntaxNode_0x3cc670 '/' 0 children>
            <SyntaxNode_0x322280 '!'\\\\' .' 2 children>
              <Sequence '!'\\\\'' 2 children>
                <Prefix '!' 1 children>
                  <SyntaxNode_0x3d49f0 '!' 0 children>
                <Primary ''\\\\'' 3 children>
                  <SyntaxNode_0x3d8740 ''' 0 children>
                  <SyntaxNode_0x3c5d40 '\\\\' 1 children>
                    <SyntaxNode_0x383f00 '\\\\' 1 children>
                      <SyntaxNode_0x3cf6a0 '\\\\' 0 children>
                  <SyntaxNode_0x3d6140 ''' 0 children>
              <Sequence '.' 1 children>
                <Primary '.' 1 children>
                  <SyntaxNode_0x39e770 '.' 0 children>
    <Definition 'LEFTARROW  <- '<-' Spacing' 3 children>
      <Identifier 'LEFTARROW' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''<-' Spacing' 1 children>
        <SyntaxNode_0x3de4d0 ''<-' Spacing' 2 children>
          <Sequence ''<-'' 1 children>
            <Primary ''<-'' 3 children>
              <SyntaxNode_0x3a0dd0 ''' 0 children>
              <SyntaxNode_0x3c8290 '<-' 2 children>
                <SyntaxNode_0x3ad9e0 '<' 1 children>
                  <SyntaxNode_0x3b56e0 '<' 1 children>
                    <SyntaxNode_0x3de0a0 '<' 0 children>
                <SyntaxNode_0x2f9330 '-' 1 children>
                  <SyntaxNode_0x3bf7c0 '-' 1 children>
                    <SyntaxNode_0x393ce0 '-' 0 children>
              <SyntaxNode_0x392590 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'SLASH      <- '/' Spacing' 3 children>
      <Identifier 'SLASH' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''/' Spacing' 1 children>
        <SyntaxNode_0x3d39f0 ''/' Spacing' 2 children>
          <Sequence ''/'' 1 children>
            <Primary ''/'' 3 children>
              <SyntaxNode_0x39a330 ''' 0 children>
              <SyntaxNode_0x32bec0 '/' 1 children>
                <SyntaxNode_0x3cd2f0 '/' 1 children>
                  <SyntaxNode_0x3dd310 '/' 1 children>
                    <SyntaxNode_0x3d9600 '/' 0 children>
              <SyntaxNode_0x3c7fe0 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'AND        <- '&' Spacing' 3 children>
      <Identifier 'AND' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''&' Spacing' 1 children>
        <SyntaxNode_0x3dc3f0 ''&' Spacing' 2 children>
          <Sequence ''&'' 1 children>
            <Primary ''&'' 3 children>
              <SyntaxNode_0x3ac8f0 ''' 0 children>
              <SyntaxNode_0x3933d0 '&' 1 children>
                <SyntaxNode_0x3926d0 '&' 1 children>
                  <SyntaxNode_0x3d6af0 '&' 1 children>
                    <SyntaxNode_0x3c6e30 '&' 0 children>
              <SyntaxNode_0x3c1be0 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'NOT        <- '!' Spacing' 3 children>
      <Identifier 'NOT' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''!' Spacing' 1 children>
        <SyntaxNode_0x3bb4e0 ''!' Spacing' 2 children>
          <Sequence ''!'' 1 children>
            <Primary ''!'' 3 children>
              <SyntaxNode_0x3a3040 ''' 0 children>
              <SyntaxNode_0x261910 '!' 1 children>
                <SyntaxNode_0x3dd970 '!' 1 children>
                  <SyntaxNode_0x39eb90 '!' 1 children>
                    <SyntaxNode_0x3c82e0 '!' 0 children>
              <SyntaxNode_0x2cc870 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'QUESTION   <- '?' Spacing' 3 children>
      <Identifier 'QUESTION' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''?' Spacing' 1 children>
        <SyntaxNode_0x28f510 ''?' Spacing' 2 children>
          <Sequence ''?'' 1 children>
            <Primary ''?'' 3 children>
              <SyntaxNode_0x3d99f0 ''' 0 children>
              <SyntaxNode_0x3d2900 '?' 1 children>
                <SyntaxNode_0x39ed00 '?' 1 children>
                  <SyntaxNode_0x3943f0 '?' 1 children>
                    <SyntaxNode_0x395cf0 '?' 0 children>
              <SyntaxNode_0x3cb030 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'STAR       <- '*' Spacing' 3 children>
      <Identifier 'STAR' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''*' Spacing' 1 children>
        <SyntaxNode_0x28fb80 ''*' Spacing' 2 children>
          <Sequence ''*'' 1 children>
            <Primary ''*'' 3 children>
              <SyntaxNode_0x36a630 ''' 0 children>
              <SyntaxNode_0x39d4b0 '*' 1 children>
                <SyntaxNode_0x3a6de0 '*' 1 children>
                  <SyntaxNode_0x3aead0 '*' 1 children>
                    <SyntaxNode_0x3b73b0 '*' 0 children>
              <SyntaxNode_0x3cdb50 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'PLUS       <- '+' Spacing' 3 children>
      <Identifier 'PLUS' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''+' Spacing' 1 children>
        <SyntaxNode_0x3e9c30 ''+' Spacing' 2 children>
          <Sequence ''+'' 1 children>
            <Primary ''+'' 3 children>
              <SyntaxNode_0x397950 ''' 0 children>
              <SyntaxNode_0x3a1250 '+' 1 children>
                <SyntaxNode_0x2d9b60 '+' 1 children>
                  <SyntaxNode_0x3d2bf0 '+' 1 children>
                    <SyntaxNode_0x3d8520 '+' 0 children>
              <SyntaxNode_0x3a9340 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'OPEN       <- '(' Spacing' 3 children>
      <Identifier 'OPEN' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''(' Spacing' 1 children>
        <SyntaxNode_0x2d4190 ''(' Spacing' 2 children>
          <Sequence ''('' 1 children>
            <Primary ''('' 3 children>
              <SyntaxNode_0x3aead0 ''' 0 children>
              <SyntaxNode_0x347a10 '(' 1 children>
                <SyntaxNode_0x3d6300 '(' 1 children>
                  <SyntaxNode_0x3e0320 '(' 1 children>
                    <SyntaxNode_0x3411e0 '(' 0 children>
              <SyntaxNode_0x399330 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'CLOSE      <- ')' Spacing' 3 children>
      <Identifier 'CLOSE' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '')' Spacing' 1 children>
        <SyntaxNode_0x3df760 '')' Spacing' 2 children>
          <Sequence '')'' 1 children>
            <Primary '')'' 3 children>
              <SyntaxNode_0x3c8360 ''' 0 children>
              <SyntaxNode_0x3b44a0 ')' 1 children>
                <SyntaxNode_0x35d570 ')' 1 children>
                  <SyntaxNode_0x30bcc0 ')' 1 children>
                    <SyntaxNode_0x3b1cb0 ')' 0 children>
              <SyntaxNode_0x38f0a0 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'DOT        <- '.' Spacing' 3 children>
      <Identifier 'DOT' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''.' Spacing' 1 children>
        <SyntaxNode_0x3ddb70 ''.' Spacing' 2 children>
          <Sequence ''.'' 1 children>
            <Primary ''.'' 3 children>
              <SyntaxNode_0x3e1340 ''' 0 children>
              <SyntaxNode_0x327f00 '.' 1 children>
                <SyntaxNode_0x30ff30 '.' 1 children>
                  <SyntaxNode_0x3aa940 '.' 1 children>
                    <SyntaxNode_0x3cbb40 '.' 0 children>
              <SyntaxNode_0x3cf580 ''' 0 children>
          <Sequence 'Spacing' 1 children>
            <Primary 'Spacing' 1 children>
              <Identifier 'Spacing' 0 children>
    <Definition 'Spacing    <- (Space / Comment)*' 3 children>
      <Identifier 'Spacing' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '(Space / Comment)*' 1 children>
        <SyntaxNode_0x3df0b0 '(Space / Comment)*' 1 children>
          <Sequence '(Space / Comment)*' 2 children>
            <Primary '(Space / Comment)' 3 children>
              <SyntaxNode_0x3c6210 '(' 1 children>
                <SyntaxNode_0x3e45c0 '(' 0 children>
              <Expression 'Space / Comment' 2 children>
                <SyntaxNode_0x3b21c0 'Space' 1 children>
                  <Sequence 'Space' 1 children>
                    <Primary 'Space' 1 children>
                      <Identifier 'Space' 0 children>
                <SyntaxNode_0x3ddec0 '/ Comment' 1 children>
                  <SyntaxNode_0x3a2650 '/ Comment' 2 children>
                    <SyntaxNode_0x3a1860 '/' 1 children>
                      <SyntaxNode_0x3def80 '/' 0 children>
                    <SyntaxNode_0x39b440 'Comment' 1 children>
                      <Sequence 'Comment' 1 children>
                        <Primary 'Comment' 1 children>
                          <Identifier 'Comment' 0 children>
              <SyntaxNode_0x39e000 ')' 1 children>
                <SyntaxNode_0x2f89c0 ')' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x3ca2d0 '*' 0 children>
    <Definition 'Comment    <- '#' (!EndOfLine .)* EndOfLine' 3 children>
      <Identifier 'Comment' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''#' (!EndOfLine .)* EndOfLine' 1 children>
        <SyntaxNode_0x353b00 ''#' (!EndOfLine .)* EndOfLine' 3 children>
          <Sequence ''#'' 1 children>
            <Primary ''#'' 3 children>
              <SyntaxNode_0x3af5a0 ''' 0 children>
              <SyntaxNode_0x3a5de0 '#' 1 children>
                <SyntaxNode_0x3bb620 '#' 1 children>
                  <SyntaxNode_0x3bfad0 '#' 1 children>
                    <SyntaxNode_0x3c4440 '#' 0 children>
              <SyntaxNode_0x3dfe20 ''' 0 children>
          <Sequence '(!EndOfLine .)*' 2 children>
            <Primary '(!EndOfLine .)' 3 children>
              <SyntaxNode_0x3d4ae0 '(' 1 children>
                <SyntaxNode_0x2f0d60 '(' 0 children>
              <Expression '!EndOfLine .' 1 children>
                <SyntaxNode_0x3e5030 '!EndOfLine .' 2 children>
                  <Sequence '!EndOfLine' 2 children>
                    <Prefix '!' 1 children>
                      <SyntaxNode_0x3bd7e0 '!' 0 children>
                    <Primary 'EndOfLine' 1 children>
                      <Identifier 'EndOfLine' 0 children>
                  <Sequence '.' 1 children>
                    <Primary '.' 1 children>
                      <SyntaxNode_0x25e200 '.' 0 children>
              <SyntaxNode_0x3d9bd0 ')' 1 children>
                <SyntaxNode_0x3a7080 ')' 0 children>
            <Suffix '*' 1 children>
              <SyntaxNode_0x3e0ca0 '*' 0 children>
          <Sequence 'EndOfLine' 1 children>
            <Primary 'EndOfLine' 1 children>
              <Identifier 'EndOfLine' 0 children>
    <Definition 'Space      <- ' ' / '\\t' / EndOfLine' 3 children>
      <Identifier 'Space' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '' ' / '\\t' / EndOfLine' 2 children>
        <SyntaxNode_0x3b3640 '' '' 1 children>
          <Sequence '' '' 1 children>
            <Primary '' '' 3 children>
              <SyntaxNode_0x3bdd70 ''' 0 children>
              <SyntaxNode_0x3ba200 ' ' 1 children>
                <SyntaxNode_0x3cd9d0 ' ' 1 children>
                  <SyntaxNode_0x3c3270 ' ' 1 children>
                    <SyntaxNode_0x2f4590 ' ' 0 children>
              <SyntaxNode_0x3b5ad0 ''' 0 children>
        <SyntaxNode_0x3a43f0 '/ '\\t' / EndOfLine' 2 children>
          <SyntaxNode_0x3d59b0 '/ '\\t'' 2 children>
            <SyntaxNode_0x3b7530 '/' 1 children>
              <SyntaxNode_0x3948d0 '/' 0 children>
            <SyntaxNode_0x3b7670 ''\\t'' 1 children>
              <Sequence ''\\t'' 1 children>
                <Primary ''\\t'' 3 children>
                  <SyntaxNode_0x3cce40 ''' 0 children>
                  <SyntaxNode_0x3d57f0 '\\t' 1 children>
                    <SyntaxNode_0x3d0790 '\\t' 1 children>
                      <SyntaxNode_0x3a0660 '\\t' 0 children>
                  <SyntaxNode_0x38bbb0 ''' 0 children>
          <SyntaxNode_0x3d4360 '/ EndOfLine' 2 children>
            <SyntaxNode_0x2e7970 '/' 1 children>
              <SyntaxNode_0x3d90c0 '/' 0 children>
            <SyntaxNode_0x3dc440 'EndOfLine' 1 children>
              <Sequence 'EndOfLine' 1 children>
                <Primary 'EndOfLine' 1 children>
                  <Identifier 'EndOfLine' 0 children>
    <Definition 'EndOfLine  <- '\\r\\n' / '\\n' / '\\r'' 3 children>
      <Identifier 'EndOfLine' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression ''\\r\\n' / '\\n' / '\\r'' 2 children>
        <SyntaxNode_0x2f3020 ''\\r\\n'' 1 children>
          <Sequence ''\\r\\n'' 1 children>
            <Primary ''\\r\\n'' 3 children>
              <SyntaxNode_0x398fa0 ''' 0 children>
              <SyntaxNode_0x3c8350 '\\r\\n' 2 children>
                <SyntaxNode_0x3cbec0 '\\r' 1 children>
                  <SyntaxNode_0x3d07f0 '\\r' 0 children>
                <SyntaxNode_0x3ad400 '\\n' 1 children>
                  <SyntaxNode_0x3a46e0 '\\n' 0 children>
              <SyntaxNode_0x3ddf30 ''' 0 children>
        <SyntaxNode_0x3dc930 '/ '\\n' / '\\r'' 2 children>
          <SyntaxNode_0x3ddb30 '/ '\\n'' 2 children>
            <SyntaxNode_0x252d40 '/' 1 children>
              <SyntaxNode_0x38e270 '/' 0 children>
            <SyntaxNode_0x3c1080 ''\\n'' 1 children>
              <Sequence ''\\n'' 1 children>
                <Primary ''\\n'' 3 children>
                  <SyntaxNode_0x3da700 ''' 0 children>
                  <SyntaxNode_0x3b3e30 '\\n' 1 children>
                    <SyntaxNode_0x3a4ae0 '\\n' 1 children>
                      <SyntaxNode_0x3d77a0 '\\n' 0 children>
                  <SyntaxNode_0x3bd2a0 ''' 0 children>
          <SyntaxNode_0x3c9590 '/ '\\r'' 2 children>
            <SyntaxNode_0x3c6e40 '/' 1 children>
              <SyntaxNode_0x367dc0 '/' 0 children>
            <SyntaxNode_0x3b1fb0 ''\\r'' 1 children>
              <Sequence ''\\r'' 1 children>
                <Primary ''\\r'' 3 children>
                  <SyntaxNode_0x3d24f0 ''' 0 children>
                  <SyntaxNode_0x3d9320 '\\r' 1 children>
                    <SyntaxNode_0x3dfc00 '\\r' 1 children>
                      <SyntaxNode_0x3a2570 '\\r' 0 children>
                  <SyntaxNode_0x351080 ''' 0 children>
    <Definition 'EndOfFile  <- !.' 3 children>
      <Identifier 'EndOfFile' 0 children>
      <LeftArrow '<-' 0 children>
      <Expression '!.' 1 children>
        <SyntaxNode_0x3e0f30 '!.' 1 children>
          <Sequence '!.' 2 children>
            <Prefix '!' 1 children>
              <SyntaxNode_0x3d2790 '!' 0 children>
            <Primary '.' 1 children>
              <SyntaxNode_0x3d08f0 '.' 0 children>
*/