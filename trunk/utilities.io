p := method(
  call message arguments foreach( arg,
    "#{arg}: #{arg doInContext( call sender )}" interpolate println
  )
)

Call callStack := method(
  stack := list( self )
  while( stack last getSlot("sender") and stack last sender getSlot("call"),
    stack push( stack last sender call )
  )
  stack
)

OperatorTable addOperator("||", 13)
Object || := method(
  if ( self,
    m := call message next ?next
    if ( m, call message setNext( m ) )    
    self
  ,
    call evalArgAt(0)
  )
)

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
      # ".." repeated( caller callStack size - 1 ) print
      #".." print
      "#{sender call message} with '#{sender currentString asMutable escape}'" interpolate println
    )
    returns := method(
      val := call evalArgAt( 0 )
      # caller := call sender call
      # ".." repeated( caller callStack size - 1 ) print
      "..[#{call sender call message name}] returns: #{val}" interpolate println
    )
    returns2 := method(
      val := call evalArgAt( 0 )
      # caller := call sender call
      # ".." repeated( caller callStack size - 1 ) print
      "#{call sender call message} returns: #{val}" interpolate println
    )
  )
)

DEBUG_ON := false