functor
import
  Application(exit:Exit)
  System
define
  \insert List.oz
  \insert RPN_MDC.oz
  \insert Postfix_RPN_MDC.oz

  {System.showInfo {Infix {Tokenize {Lex "1 2 + 3 +"}}}.1} % 3a
  {System.showInfo {Infix [number(3.0) number(10.0) number(9.0) operator(type:multiply) operator(type:minus) number(0.3) operator(type:plus)]}} % 3a
  {System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}}
  {System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 + ^ i"}}}}

  {Exit 0}
end
