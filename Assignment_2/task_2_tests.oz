functor
import
  Application(exit:Exit)
  System
define
  \insert List.oz
  \insert RPN_MDC.oz

  {System.show {Lex "1 2 + 3 *"}} % 2a
  {System.show {Tokenize ["1" "2" "+" "3" "*" "/" "-"]}} % 2b
  {System.show {Interpret {Tokenize {Lex "3 10 /"}}}} % 2c
  {System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}} % 2c
  {System.show {Interpret [number(1) number(2) number(3) operator(type:plus)]}} % 2c
  {PrintStack {Interpret {Tokenize {Lex "1 2 3 p +"}}}} % 2d
  {PrintStack {Interpret {Tokenize {Lex "1 2 3 + d"}}}} % 2e
  {PrintStack {Interpret {Tokenize {Lex "1 2 -3 * d i"}}}} % 2f
  {PrintStack {Interpret {Tokenize {Lex "1 2 3 + d ^"}}}} % 2g
  {Exit 0}
end
