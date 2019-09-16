% Infix takes in Tokens which is a list of RPN tokens and returns the postfix notation of them (with parantheses)
% Iterating through the Tokens recursively, if the first element is a number, add it to the Stack.
% If the first element is a command, take the first element from the stack and perform the proper string format
% by checking the Commands record  and add it to the stack.
% If the first element is an operation, take the first two elements from the Stack, add the correct
% amount of parantheses as well as the proper operation from the Operations record and add it to the stack
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
    % If the first element is a number, add it to ExpressionStack
    case Tokens of number(Number)|Tail then
      {InfixInternal Tail Number|ExpressionStack}

    % If the first element is a command, get the proper notation and perform the right string format depending on the command
    [] command(Command)|Tail then
      Number1 | Rest = ExpressionStack in
        if Command == 'multiInverseTop' then
          {InfixInternal Tail "1 / ( "#Number1#" )"|Rest}
        elseif Command == 'flipTop' then
          {InfixInternal Tail "~ ( "#Number1#" )"|Rest}
        else
          raise "Unexpected command" end
        end
    
    % If the first element is an operation, get the proper notation and perform the right string format depending on the operation
    [] operator(type:Operation)|Tail then
      Number1 | Number2 | Rest = ExpressionStack in
      if Operation == 'divide' orelse Operation == 'multiply' then
        {InfixInternal Tail "("#Number2#" "#Operations.Operation#" "#Number1#")"|Rest}
      elseif Operation == 'plus' orelse Operation == 'minus' then
        {InfixInternal Tail Number2#" "#Operations.Operation#" "#Number1|Rest}
      else
        raise "Unexpected operation" end
      end

    % If there are no more elements, return the Stack
    else
      ExpressionStack
    end
  end
in
  % Return the first (and only) element in the list
  {InfixInternal Tokens nil}.1
end
