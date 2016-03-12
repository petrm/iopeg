**EOF**
```
   EOF <- !.
```

**Space delimited words**
with an ending delimiter that may include some whitespace
```
  paragraph <- ( !(word the_end) word space+ )* word the_end
```