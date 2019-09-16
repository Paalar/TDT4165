% This was done in the previous assignment, not uploaded

% Returns the length the list List
% It is calculated by adding 1 recursively until the last element is nil
fun {Length List}
  case List of Head|Tail then
    1 + {Length Tail}
  else
    0
  end
end

% Returns the first Count members of the list List
% By going through the list recursively while subtracting 1 until Count is zero
% and returning the Head element for each iteration, and when Count is zero, it returns nil -
% which returns the first Count elements of List
fun {Take List Count}
  if Count == 0 then
    nil
  else
    case List of Head|Tail then
      Head|{Take Tail Count - 1}
    else
      nil
    end
  end
end

% Returns a list with the first Count items removed from List
% Recursively iterate through the List while subtracting 1 from Count and dropping Head.
% When Count reaches 0 return the List when the Count Head elements have been removed
fun {Drop List Count}
  if Count == 0 then
    List
  else
    case List of Head|Tail then
      {Drop Tail Count - 1}
    else
      nil
    end
  end
end

% Returns a 1D list of List1 and List2 combined
% Recursively go through the elements of List1, returning the Head element until there are no elements in List1
% Then it returns List2, which will return the List1 appended on List2
fun {Append List1 List2}
  if {Length List1} == 0 then
    List2
  else
    case List1 of Head|Tail then
      Head|{Append Tail List2}
    else
      nil
    end
  end
end

% Returns true if an element is a part of a list, false if not
% Iterating the List recursively checking if Head is the same as Element.
% If none match, return false
fun {Member List Element}
  case List of Head|Tail then
    if Head == Element then
      true
    else
      {Member Tail Element}
    end
  else
    false
  end
end

% Returns the index of the element if present in List, else nil
% Iterating the list recursively by checking if the Head equals Element,
% if Head != Element, add 1, else add 0 and sum all the 1s
fun {Position List Element}
  case List of Head|Tail then
    if Head == Element then
      0
    else
      1 + {Position Tail Element}
    end
  else
    0 % If the element does not exist it will return the length of the list +1
  end
end
