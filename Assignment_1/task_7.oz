functor
import
  Application(exit:Exit)
  System
define
  fun {Length List} % Returns the length the list List
    case List of Head|Tail then
      1 + {Length Tail}
    else
      0
    end
  end

  fun {Take List Count} % Returns the first Count members of the list List
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

  fun {Drop List Count} % Returns a list with the first Count items removed from List
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

  fun {Append List1 List2} % Returns a 1D list of List1 and List2
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

  fun {Member List Element} % Returns true if an element is a part of a list, false if not
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

  fun {Position List Element} % Returns the index of the element if present in List, else nil
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

  List = [1 2 8 10]
  List2 = [3 20 40]
  {System.showInfo {Length List}} % 7a
  {System.show {Take List 20}} % 7b
  {System.show {Drop List 1}} % 7c
  {System.show {Append List List2}} % 7d
  {System.show {Member List 2}} % 7e
  {System.show {Member List 20}} % 7e
  {System.show {Position List 2}} % 7f
  {System.show {Position List 20}} % 7f
  {Exit 0}
end
