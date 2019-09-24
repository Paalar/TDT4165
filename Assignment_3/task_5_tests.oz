functor
import
  Application(exit:Exit)
  System
define
  \insert task_5.oz

  {System.showInfo "Should return 0"}
  {System.show {LazyNumberGenerator 0}}
  {System.showInfo "Should return 1"}
  {System.show {{LazyNumberGenerator 0}.2}.1}
  {System.showInfo "Should return 2"}
  {System.show {{{LazyNumberGenerator 0}.2}.2}.1}
  {System.showInfo "Should return 3"}
  {System.show {{{{LazyNumberGenerator 0}.2}.2}.2}.1}
  {System.showInfo "Should return 4"}
  {System.show {{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.1}
  {System.showInfo "Should return 5"}
  {System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}
  
  {Exit 0}
end
