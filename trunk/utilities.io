p := method(
  call message arguments foreach( arg,
    "#{arg}: #{arg doInContext( call sender )}" interpolate println
  )
)

# Because `foo or bar` returns `true`
firstNonNil := method(
  call message arguments foreach( arg,
    result := arg doInContext( call sender )
    if( result, return result )
  )
  result
)

Call callStack := method(
  stack := list( self )
  while( stack last getSlot("sender") and stack last sender getSlot("call"),
    stack push( stack last sender call )
  )
  stack
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