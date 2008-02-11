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
