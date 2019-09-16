functor
import
  Application(exit:Exit)
  System
define
  proc {Circle R}
    Pi = 355.0/113.0
    Area = Pi*R*R
    Diameter = 2.0 * R
    Circumference = 2.0 * Pi * R
  in
    {System.showInfo "Area is "#Area}
    {System.showInfo "Diameter is "#Diameter}
    {System.showInfo "Circumference is "#Circumference}
  end

  {Circle 10.0}
  {Exit 0}
end
