Here are some things about Io that surprised me as I came to learn it. As background, I have experience in JavaScript, Lua, and Ruby.

```
t1 := Date now
t2 := Date now
# oops; t1 just got mutated
# must use Date clone now
```

  * Bad docs for `Number asString`

  * `Number asString`, first param oddly named

  * Where's sprintf? Any convenient way of formatting numbers as strings?

  * Why is `Protos Addons` not the same as Protos protos last? _(discussed on mailing list)_

  * The 'magic' `updateSlot` that operates on `self` and the 'magic' `forward` that forwards messages to `self` conflicts mentally with no 'magic' `setSlot`. It's hard to know when you must use `self` in a method, and when it's OK not to. (Especially with `do(...)` not requiring it.)

```
thisLocalContext slotNames contains( "forward" ) == false
thisLocalContext protos isEmpty == true
# ... so how does it forward messages to self?
```
_Steve Dekorte says that there's an optimization that hard-looks in Locals instead of via protos._

  * Frustrating amount of no-documentation methods. Not just no examples, but not even a summary description.

  * The word 'context' is confusing. Why not just 'object'?

  * There is `Sequence endsWithSeq`, where is `startsWithSeq`?

  * In Ruby, `Array#empty?` tests if it's empty. A few times I've done `myList empty` and been weirded out when it never returns `false`.

  * `foo or false` results in `true`, not `foo`. Makes it harder to make guard statements than Ruby/JS/Lua.

  * `foo := Object clone; foo true := foo; foo true #=> true` Why isn't this 'foo'?

  * `"foo\nbar" escape #=> Exception: 'escape' cannot be called on an immutable Sequence` Why would I expect `escape` to mutate the sequence instead of returning a copy? Why shouldn't I expect `slice()` to mutate the sequence? How do I know which Sequence methods will throw an exception on an Immutable Sequence?

  * There's no way to write an operator with higher precendence than message passing, e.g. `foo ! bar println`

  * += doesn't work on Mutable sequences; gives unhelpful exception