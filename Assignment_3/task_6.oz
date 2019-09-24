fun {Sum List}
  fun {TailRecursionSum List Sum}
    case List of Head|Tail then
      {TailRecursionSum Tail Sum + Head}
    else
      Sum
    end
  end
in
  {TailRecursionSum List 0}
end
