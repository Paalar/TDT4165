functor
import
  Application(exit:Exit)
  System
define
  \insert task_6.oz

  {System.showInfo "Should output 6"}
  {System.show {Sum [1 2 3]}} % 6a

  {System.showInfo "Should output 10"}
  {System.show {Sum [5 5]}} % 6a

  {System.showInfo "Should output 7"}
  {System.show {Sum [7]}} % 6a

  % 6b Since tail recursion reuses the constant variable and returns that value at the end
  % instead of remembering each value when going counting backwards it uses a lot less memory
  % making it more efficient

  % 6c Tail recursion is not beneficial for all programming languages, it depends if the compiler
  % can recognize the loop as tail recursion or not.

  {Exit 0}
end
