require 'rubygems'
require 'treetop'
require 'eng'

p EngParser.new.parse( "Hello there you fine world!" )

__END__
* 'Hello there you fine world!'
  * 'Hello'
    * 'ello'
      * 'e'
      * 'l'
      * 'l'
      * 'o'
  * ' there you fine world'
    * ' '
    * 'there'
      * 't'
      * 'h'
      * 'e'
      * 'r'
      * 'e'
    * ' '
    * 'you'
      * 'y'
      * 'o'
      * 'u'
    * ' '
    * 'fine'
      * 'f'
      * 'i'
      * 'n'
      * 'e'
    * ' '
    * 'world'
      * 'w'
      * 'o'
      * 'r'
      * 'l'
      * 'd'
  * '!'
  