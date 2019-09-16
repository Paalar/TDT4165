functor
import
  Application(exit:Exit)
  System
define
  fun {Min X Y}
    if X < Y then
      X
    else
      Y
    end
  end

  fun {Max X Y}
    if X > Y then
      X
    else
      Y
    end
  end

  proc {PrintGreater X Y}
    {System.showInfo {Max X Y}}
  end

  {System.showInfo {Min 10 89}}
  {System.showInfo {Max 10 89}}
  {PrintGreater 999 1000}
  {Exit 0}
end
