fun {Lex Input} % Returns the input (String) as single tokens in a list
  Split
in 
  {String.tokens Input & Split}
  Split
end

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
