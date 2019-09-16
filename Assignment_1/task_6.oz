functor
import
  Application(exit:Exit)
  System
define
  fun {IncUntil Start Stop} A in
    {System.showInfo "Pushing Start: "#Start}
    if Start < Stop then
      A = {IncUntil Start+1 Stop}
    else
      A = Stop
    end
    {System.showInfo "Popping Start: "#Start}
    A
  end

  fun {Factorial Number}
    if Number > 0 then
      Number*{Factorial Number-1}
    else
      1
    end
  end
  {System.showInfo {IncUntil 10 15}}
  {System.showInfo {Factorial 3}}
  {Exit 0}
end
