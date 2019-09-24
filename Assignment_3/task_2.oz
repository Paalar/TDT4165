fun {Sum List}
  case List of Head|Tail then
    Head + {Sum Tail}
  else
    0
  end
end
