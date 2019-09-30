functor
import
  Application(exit:Exit)
  System
define
  \insert streams_and_threads.oz

  %1a
  {System.showInfo "{GenerateOdd ~3 10} should print [∼3 ∼1 1 3 5 7 9]"}
  {System.show {GenerateOdd ~3 10}}

  {System.showInfo "{GenerateOdd 3 3} should print [3]"}
  {System.show {GenerateOdd 3 3}}

  {System.showInfo "{GenerateOdd 2 2} should print nil"}
  {System.show {GenerateOdd 2 2}}

  %1b
  {System.showInfo "{Product [1 2 3 4]} should print 24"}
  {System.show {Product [1 2 3 4]}}
  {Exit 0}
end
