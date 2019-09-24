fun {RightFold List Op U} % Function as given in task 3
  case List of Head|Tail then % If there still are elements to List
    {Op Head {RightFold Tail Op U}} % Recursively use Op, as well as RightFold on the Head and Tail elements of List
  else % If there are no more elements in List
    U % return U
  end
end % 3a, 3b

fun {Length List}
  {RightFold List fun {$ X Y} 1 + Y end 0}
end % 3c

fun {Sum List}
  {RightFold List fun {$ X Y} X + Y end 0}
end % 3c
