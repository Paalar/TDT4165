fun {Sum List}
  fun {TailRecursionIterator List Sum}
    case List of Head|Tail then
      {TailRecursionIterator Tail Sum + Head}
    else
      Sum
    end
  end
in
  {TailRecursionIterator List 0}
end
