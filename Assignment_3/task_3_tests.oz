functor
import
  Application(exit:Exit)
  System
define
  \insert task_3.oz

  {System.showInfo "Should output 4"}
  {System.show {Length [1 2 3 4]}} %3c - length test

  {System.showInfo "Should output 10"}
  {System.show {Sum [1 2 3 4]}} %3c - sum test

  % 3d folding left would not have any implications on sum or length
  % right folding with subtraction of list [1 2 3 4] would result in 1 - 2 - 3 - 4 = -8
  % left folding with subtraction of list [1 2 3 4] would result in 4 - 3 - 2 - 1 = -2, a completely different number

  % 3e Since multiplying 0 with anything results in 0, and multiplying 1 with anything results in anything.
  % 1 would be a better choice

  {Exit 0}
end
