# Io Nuggets! #
**Dynamic Parameter Evaluation**
```
foo := method( a1, "all done" println )
bar := method( "hello" println )
bad := method( "OH NOES!" println )
foo( bar, bad bad bad )
#=> hello
#=> all done
```
Any arguments not explicitly listed at method define time aren't executed during method dispatch. However, the full syntax tree of what you wrote for that parameter is totally intact. You can choose, inside the method, to eval the methods in whatever scope you want.

This is how select and map work in their shorthand forms, evaling the supplied code in another scope:
```
self foreach( v,
  doInContext(getSlot("v"), call sender)
  ...
)
```

---

**Benchmarking** for maximum premature optimization
```
time := method( iterations,
  list( "WARMUP", "RACETIME" ) foreach( title,
    title println
    args := call message arguments slice( 1 )
    longest := args map( asString size ) max
    args foreach( arg,
      start := Date clone now
      iterations repeat(
        arg doInContext # what params should I really use here?
      )
      end := Date clone now
      writeln(
        arg asString alignLeft( longest, " " ),
        ( end - start ) seconds asString( 8, 3 )
      )
    )
  )
)

time( 5000, b methods1, b methods2 )
#=> WARMUP
#=> b methods    4.455
#=> b methods2   5.252
#=> RACETIME
#=> b methods    4.458
#=> b methods2   5.256
```
Coolness:
  * It uses the actual source code of what you wrote as the labels
  * As seen above, there's no lambdas or string eval, just write as many as you want.

---

**|| as a guard**
```
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
```
_Acts like Ruby_

---

**||=**
```
OperatorTable addAssignOperator( "||=", "updateSlotIfExist" )
updateSlotIfExist := method( seq, val,
  currentValue := call sender doMessage( seq asMessage )  
  if( currentValue,
    currentValue
  ,
    call sender updateSlot( seq, val )
  )
)
```
_Unlike Ruby, does not setSlot if it doesn't already exist_

---

**Find a list of methods available on an object**
```
Object ownMethods := method(
  self slotNames select( name,
    # Much faster than isKindOf( Block )
    self getSlot(name) type == "Block"
  )
)

Object methods := method(
  list( self ownMethods ) appendSeq( self ancestors ) reduce( meths, ancestor,
    meths appendSeq( ancestor ownMethods )
  ) unique
)
```

---

```
foo := method( call activated call )
```
// Boom. I was trying for a strange infinite loop, and found a strange crash.

---

```
foo := method( call message protos first slotNames )
```
// Hmmmmmmm. This is cool. Some "unnamed" proto of Call objects has cool stuffs.
// Oh wait, it's "unnamed" in its asString, but it is really just Message

---

```
Directory with( launchPath ) items foreach(i,v,v name println)
```
// I'm a bit wary of 'stringing' so many calls together. But maybe that fear is invalid in Io.

---

This made me laugh, and smile:
"In case you were wondering, method is a method on Object that creates anonymous methods."

---


Random things that can be done with the regex library:
```
Io> s := "one!two!!three!!!"
==> one!two!!three!!!
Io> s splitAtRegex("!+")
==> list("one", "two", "three", "")
Io> s := "37signals"
==> 37signals
Io> s hasMatchOfRegex("signals")
==> true
Io> "one two three" allMatchesOfRegex("\\w+") map(asString println)
one
two
three
==> list("one", "two", "three")
```


---


**Monkeypatching += for Sequences**
```
Sequence += := method(str, if(isMutable, appendSeq(str), asMutable +=(str)))
```