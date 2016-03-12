![http://phrogz.net/tmp/IoPEG_PathToProfit.png](http://phrogz.net/tmp/IoPEG_PathToProfit.png)

## Checklist ##
  1. Design a PEG grammar describing a simple subject
  1. Create one or more examples that use that grammar
  1. Hand-create an Io-based LL(`*`) parser for that grammar
    * Should produce simple tree of nodes
    * Strive for parity (or better) than what Treetop produces, in terms of which parent nodes contain others
  1. Hand-create an Io-based LL(`*`) parser for the official PEG (not IoPEG) grammar
    * Also produces a tree of nodes, but where nodes are labelled with semantics specific to PEG grammar, e.g. "Identifier" and "Expression" and "Star" and "Plus" and "Group"
  1. Hand-create an Io program that turns a tree with PEG semantics into a program like 3 or 4 above.
  1. Copy the official PEG grammar from the PDF into ascii form.
    * Feeding this into #4, and then feeding that output through #5, should produce #4.
      * Let the madness begin!
  1. Create a derivation of the official PEG grammar that allows extra markup, like node labels and semantic blocks. This is described using official PEG grammar.
  1. Create a derivation of that which uses the enhanced IoPEG grammar to describe a parser.
  1. Hand-create a parser (by modifying #4) that reads in enhanced IoPEG grammars, and produces programs from them
    * Feeding #8 into #9 should produce #9.
    * Now we're bootstrapped; all additional changes to the IoPEG grammar or the parser code should be effected by modifying #8 only, and then feeding it through #9 to produce the new version of #9.
  1. Modify the PEG grammar in #1 to use IoPEG grammar to add semantics to the problem domain.
    * Feeding this through #9 should produce a program like #3, but that provides useful information on the output tree.

### Features to implement ###
  * Syntactically validate a string without the overhead of creating a tree of nodes.
  * Parse and generate a tree of syntax nodes for a given input.
    * Syntax nodes have access to the full parse text in the node
    * Syntax nodes have access to parent node
    * Syntax nodes have access to child nodes by index
    * Syntax nodes have access to child nodes by rule name
    * Syntax nodes have access to child nodes by label name
    * Syntax nodes are extended by methods defined in the grammar or separately
  * Rule features:
    * string literal terminals
      * double-quote delimited
      * single-quote delimited
      * escape sequences - whatever Io supports
    * PEG sequences
    * PEG alternation
    * Grouping parentheses
    * Character class terminals
    * PEG `?`, `*` and `+` quantifiers
    * PEG `&` and `!` predicates
    * Regexp terminals
    * Labeled rules, sequences, groups
    * Mark an entire rule as skipping or aggregating (as a leaf) production of a syntax node
    * Mark a rule, sequence, or group as skipping or aggregating a syntax node
    * Associate rules, sequences, or groups with inline Io code to add to the syntax node
    * Associate rules, sequences, or groups with objects defined in another file, to merge into the syntax node
    * Built in convenience terminals, like `EOF`, `CRLF`, `NEWLINE`, `NEWLINE_OR_EOF`...