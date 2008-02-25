p := method(
	call message arguments foreach( arg,
		"#{arg}: #{arg doInContext( call sender )}" interpolate println
	)
	call evalArgAt(0)
)

Call callStack := method(
	stack := list( self )
	while( stack last getSlot("sender") and stack last sender getSlot("call"),
		stack push( stack last sender call )
	)
	stack
)

OperatorTable addOperator("||", 13)
Object || := method( if ( self, self, call evalArgAt(0) ) )

OperatorTable addAssignOperator( "||=", "updateSlotIfExist" )
updateSlotIfExist := method( seq, val,
	currentValue := call sender doMessage( seq asMessage )  
	if( currentValue,
		currentValue
	,
		call sender updateSlot( seq, val )
	)
)

mergeWith := method( obj2,
	obj2 slotNames foreach( name,
		val := obj2 getSlot( name )
		writeln( "#{name} will become #{val} (was #{self getSlot(name)})" interpolate )
		self setSlot( name, val )
	)
	self
)

if( true,
	DEBUG := Object clone do(
		methodStart := method(
			sender := call sender
			"  " repeated( Scheduler currentCoroutine callStack size - 4 ) print
			"#{sender call message} with '#{sender currentString asMutable escape}'" interpolate println
		)
		returns := method(
			val := call evalArgAt( 0 )
			"  " repeated( Scheduler currentCoroutine callStack size - 4 ) print
			"[#{call sender call message name}] returns: #{val}" interpolate println
		)
		returns2 := method(
			val := call evalArgAt( 0 )
			"  " repeated( Scheduler currentCoroutine callStack size - 4 ) print
			"#{call sender call message} returns: #{val}" interpolate println
		)
	)
)

DEBUG_ON := false

Range asString := method( "#{first}..#{last}" interpolate )