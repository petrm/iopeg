Regex

# namespace
IoPEG := Object clone
IoPEG Parser := Object clone do(
	ParseFailure := Exception clone
	
	parseFile := method( fileName,
		self parse( File with( fileName ) contents )
	)
	
	parse := method( sourceString,
		Object ss := sourceString
		self offset := 0
		self failOffset   := -1
		self failMessages := list
		self partialTree  := nil
		self sourceString := sourceString
		if( DEBUG_ON, DEBUG methodStart )
		
		root := parseRootProduction
		root source := sourceString
		
		if( root isHosed,
			truncateChars := 40
			offset = failOffset
			msg := "Failed to parse '#{call message argAt(0)}' @ char ##{offset}\n" interpolate
			msg = msg .. "stopped parsing at: '#{currentString slice( 0, truncateChars ) asMutable escape}'\n" interpolate
			msg = msg .. failMessages reverse join( "\n" )
			ParseFailure raise( msg )
		)

		if( offset != sourceString size,
			# TODO: preference to allow not consuming all text
			ParseFailure raise( "Parsed, but did not consume '#{sourceString}'" interpolate )
		)
		root
	)
	
	failedAt := method( message,
		if( offset < failOffset, return )
		if( offset > failOffset, failMessages empty )
		failOffset = offset
		failMessages push( message )
		nil
	)
	
	# Sequentially consume each argument expression,
	# with no backtracking. If any expression returns
	# nil, fail the entire sequence and return nil.
	seq := method(
		if( DEBUG_ON, DEBUG methodStart )
		initialOffset := offset
		node := SyntaxNode clone
		call message arguments foreach( expression,
			child := expression doInContext( call sender )
			# if( DEBUG_ON, "..[seq] #{expression} yielded #{child}" interpolate println )
			if( child isValid,
				node addChild( child )
			,
				node fail
				failedAt( "Could not match '#{expression}' in #{call message}" interpolate )
				offset = initialOffset
				break
			)
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node
	)
		
	# Sequentially consume each argument expression.
	# If an expression returns nil, backtrack the offset before trying the next.
	# Return the result of the first expression that does not return nil,
	# or nil if no expression succeeds.
	choice := method(
		if( DEBUG_ON, DEBUG methodStart )
		initialOffset := offset
		call message arguments foreach( expression,
			node := expression doInContext( call sender )
			#if( DEBUG_ON, "..[choice] #{expression} yielded #{node}" interpolate println )
			if( node isValid, break )
		)
		if( node isHosed,
			# Occurs when all expressions are not valid; this is the last value
			failedAt( "Could not match any of: #{call message arguments map( a, \"'\" .. a asString .. \"'\") join(\", \")}" interpolate )
		)    
		if( DEBUG_ON, DEBUG returns(node) )
		node
	)

	# Returns a node with child nodes for each match found,
	# a non-zero range if all matches returned ranges,
	# or nil if no matches could be found.
	plus := method(
		if( DEBUG_ON, DEBUG methodStart )
		anySuccess := false
		node := SyntaxNode clone
		while( ( child := call evalArgAt(0) ) isValid,
			# includes 'skip' and 'ignore' successes
			# which may not result in an actual child addition
			anySuccess = true
			node addChild( child )
		)
		if( anySuccess not,
			node fail
			failedAt( offset, "Could not find one or more #{call message argAt(0)}" interpolate )
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node
	)

	# Returns an (empty) range if the expression could not be matched,
	# a non-zero range if all matches also returned a range,
	# or a node with child nodes for each match that succeeded
	star := method(
		if( DEBUG_ON, DEBUG methodStart )
		node := SyntaxNode clone ignore
		while( ( child := call evalArgAt(0) ) isValid,
			node addChild( child )
			node keep # FIXME: No need to do this each time, only the first valid.
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node
	)
	
	# Returns an (empty) range if the expression could not be matched,
	# or the range or node of the match if it could
	optional := method(
		if( DEBUG_ON, DEBUG methodStart )
		initialOffset := offset
		node := call evalArgAt(0)
		if( node isHosed,
			offset = initialOffset
			node   = SyntaxNode clone ignore
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node
	)

	# Positive lookahead. Returns an empty range if the expression succeeded, nil otherwise.
	ensure := method(
		if( DEBUG_ON, DEBUG methodStart )
		initialOffset := offset
		node := call evalArgAt(0)
		offset = initialOffset
		node = if( node isValid,
			SyntaxNode leaf( initialOffset, initialOffset )
		,
			failedAt( "Could not ensure '#{call message argAt(0)}'" interpolate )
			node
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node ignore
	)

	# Negative lookahead. Returns an empty range if the expression fails, nil otherwise.
	forbid := method(
		if( DEBUG_ON, DEBUG methodStart )
		initialOffset := offset
		node := call evalArgAt(0)
		offset = initialOffset
		node = if( node isValid,
			failedAt( "Found forbidden '#{call message argAt(0)}'" interpolate )
			node fail
		,
			SyntaxNode leaf( offset, offset )
		)
		if( DEBUG_ON, DEBUG returns(node) )
		node ignore
	)

	regex := method( regexString,
		# if( DEBUG_ON, DEBUG methodStart )
		node := SyntaxNode leaf( offset, offset )
		matches := currentString matchesOfRegex( "^(?:#{regexString})" interpolate ) all
		if ( matches isNotEmpty,
			match := matches first string
			offset = offset + match size
			node close = offset
		,
			failedAt( "Could not match regex '#{regexString asMutable escape}'" interpolate )
			node fail
		)
		if( DEBUG_ON, DEBUG returns2(node) )
		node
	)
	
	str := method( literal,
		# if( DEBUG_ON, DEBUG methodStart )
		node := SyntaxNode leaf( offset, offset )
		if( currentString findSeq( literal ) == 0,
			offset = offset + literal size
			node close = offset
		,
			failedAt( "Could not match string '#{literal asMutable escape}'" interpolate )
			node fail
		)
		if( DEBUG_ON, DEBUG returns2(node) )
		node
	)
	
	any := method(
		# if( DEBUG_ON, DEBUG methodStart )
		node := SyntaxNode leaf( offset, offset )
		if( offset < sourceString size,
			offset = offset + 1
			node close = offset
		,
			failedAt( offset, "Could not match . (end of input hit)" )
			node fail
		)
		if( DEBUG_ON, DEBUG returns2(node) )
		node
	)
	
	# TODO: This may be really heavy
	currentString := method(
		sourceString splitAt( offset ) last
	)
	
	addNode := method( possible )
)
doRelativeFile( "syntaxnode.io" )
doRelativeFile( "utilities.io" )

