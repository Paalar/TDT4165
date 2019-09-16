functor
import
  Application(exit:Exit)
  System
define
  \insert List.oz
  \insert Tokens.oz

  fun {Infix Tokens}
    Commands = cmd(
      flipTop:'i'
      multiInverseTop:'^'
    )
    Operations = op(
      plus:'+'
      minus:'-'
      multiply:'*'
      divide:'/'
    )
    fun {InfixInternal Tokens ExpressionStack}
      case Tokens of number(Number)|Tail then
        {InfixInternal Tail Number|ExpressionStack}
      [] command(Command)|Tail then
        {System.showInfo Command}
        Number1 | Rest = ExpressionStack in
          if Command == 'multiInverseTop' then
            {InfixInternal Tail "1 / ( "#Number1#" )"|Rest}
          elseif Command == 'flipTop' then
            {InfixInternal Tail "~ ( "#Number1#" )"|Rest}
          else
            raise "Unexpected command" end
          end
      [] operator(type:Operation)|Tail then
        Number1 | Number2 | Rest = ExpressionStack in
        if Operation == 'divide' orelse Operation == 'multiply' then
          {InfixInternal Tail "("#Number2#" "#Operations.Operation#" "#Number1#")"|Rest}
        elseif Operation == 'plus' orelse Operation == 'minus' then
          {InfixInternal Tail Number2#" "#Operations.Operation#" "#Number1|Rest}
        else
          raise "Unexpected operation" end
        end
      else
        ExpressionStack
      end
    end
  in
    {InfixInternal Tokens nil}.1
  end
  % {System.showInfo {Infix {Tokenize {Lex "1 2 + 3 +"}}}.1} % 3a
  {System.showInfo {Infix [number(3.0) number(10.0) number(9.0) operator(type:multiply) operator(type:minus) number(0.3) operator(type:plus)]}}
  {System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}}
  {System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 + ^ i"}}}}
  {Exit 0}
end
