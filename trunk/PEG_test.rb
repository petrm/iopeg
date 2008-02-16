require 'rubygems'
require 'treetop'
require 'peg'

@peg = PEGParser.new
if @peg.parse( IO.read("PEG.peg") )
  puts @peg.failure_reason
else
  p @peg
end

__END__
Expected one of  , 	, 
, 
, , #, ?, *, +, &, !, (, [, ., /, any character at line 40, column 1 (byte 1214) after 
