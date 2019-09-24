functor
import
  Application(exit:Exit)
  System
define
  \insert task_2.oz

  {System.showInfo "Should output 6"}
  {System.show {Sum [1 2 3]}}

  {System.showInfo "Should output 10"}
  {System.show {Sum [5 5]}}

  {System.showInfo "Should output 7"}
  {System.show {Sum [7]}}

  {Exit 0}
end
