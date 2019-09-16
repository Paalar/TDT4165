% Returns the input (String) as single tokens in a list
% Using the built in String.tokens function which takes in the string Input
% and the delimiter SPACE shown as '&' and sends it to the Tokens variable
fun {Lex Input}
  Tokens
in 
  {String.tokens Input & Tokens}
  Tokens
end

% The input parameter is a Lexemes, as returned by Lex and returns numbers as
% number(x), the operators as operator(type:x), and commands as command(x) where x
% is a valid input. Recursively going through all of the Lexemes and returning them
% with the right format until there are no more elements
fun {Tokenize Lexemes}
    Operations = ["+" "-" "*" "/"]
    Commands = ["p" "d" "i" "^"]
  in
  case Lexemes of Head|Tail then
    if {Member Operations Head} then
      if Head == "+" then
        operator(type:plus)|{Tokenize Tail}
      elseif Head == "-" then
        operator(type:minus)|{Tokenize Tail}
      elseif Head == "*" then
        operator(type:multiply)|{Tokenize Tail}
      elseif Head == "/" then
        operator(type:divide)|{Tokenize Tail}
      else
        nil|{Tokenize Tail}
      end
    elseif {Member Commands Head} then
      if Head == "p" then
        command(print)|{Tokenize Tail}
      elseif Head == "d" then
        command(duplicatetop)|{Tokenize Tail}
      elseif Head == "i" then
        command(flipTop)|{Tokenize Tail}
      elseif Head == "^" then
        command(multiInverseTop)|{Tokenize Tail}
      else
        nil|{Tokenize Tail}
      end
    else
      number({String.toFloat Head})|{Tokenize Tail}
    end
  else
    nil
  end
end

% A procedure which takes a Stack as an input, using StringifyList, and reversing it
proc {PrintStack Stack}
  RpnStringifiedList = {List.reverse {StringifyList Stack}}
in
  {System.show {Tokenize RpnStringifiedList}}
end

% Iterates through the List recursively, converts each Float to a string until there are no elements
fun {StringifyList List}
  case List of Head|Tail then
    {Float.toString Head}|{StringifyList Tail}
  else
    List
  end
end

% Returns the Stack with the first element duplicated
fun {DuplicateTopElement Stack}
  case Stack of Head|Tail then
    Head|Head|Tail
  else
    Stack
  end
end

% Returns the stack with the first element reversed with ~
fun {FlipTopElement Stack}
  case Stack of Head|Tail then
    ~Head|Tail
  else
    Stack
  end
end

% Returns the stack with the first element executed with the Multiplicative Inverse function
fun {MultiplicativeInverseTopElement Stack}
  case Stack of Head|Tail then
    {Float.'/' 1.0 Head}|Tail
  else
    Stack
  end
end

% Returns the calculation of valid RPN tokens
% The record Commands and Operations splits the functionality, and is accessed by the
% variable on the left side of the colon (:) and the right of it is executed
% For the Commands I have created helper functions above to make it more readable
fun {Interpret Tokens}
  Commands = cmd(
    print:proc {$ Stack} {PrintStack Stack} end
    duplicatetop:fun {$ Stack} {DuplicateTopElement Stack} end
    flipTop: fun {$ Stack} {FlipTopElement Stack} end
    multiInverseTop: fun {$ Stack} {MultiplicativeInverseTopElement Stack} end
  )
  Operations = op(
    plus:Number.'+'
    minus:Number.'-'
    multiply:Number.'*'
    divide:Float.'/'
  )
  fun {Iterate Stack Tokens}
    % If there are no more elements in Tokens we are finished, and returns the Stack
    case Tokens of nil then
      Stack

    % If the first element is a number, remove it from Tokens and add it to the Stack
    [] number(Number)|Tail then
      {Iterate Number|Stack Tail}

    % If the first element is a type of Operation, get the first first two elements of the Stack
    % perform the operation on the first two elements using the record Operation, and add it to the Stack
    [] operator(type:Operation)|Tail then
      Number1 | Number2 | Rest = Stack in
        {Iterate {Operations.Operation Number1 Number2}|Rest Tail}

    % If the first element is a type of Command, check if it is a print command, then execute it through the
    % Commands record, then Iterate on the rest of the Stack. Else just execute the Command, this is due
    % to PrintStack is a procedure and not a function
    [] command(Command)|Tail then
      if Command == print then
        {Commands.Command Stack}
        {Iterate Stack Tail}
      else
        {Iterate {Commands.Command Stack} Tail}
      end

    % If nothing matches, Tokens contain an illegal token and then raise an exception
    else
      raise "Unvalid expression" end
    end
  end
in
  % To return the calculation in the proper format it needs to be tokenized, then reversed
  {List.reverse {Tokenize {Iterate nil Tokens}}}
end
