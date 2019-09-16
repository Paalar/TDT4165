functor
import
  System
define
  Y = 300
  Z = 30
  X = Y*Z
  thread {System.showInfo X} end
  A = "This is a string"
  thread {System.showInfo B} end
  B = A
end
