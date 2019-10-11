functor
import
  Application(exit:Exit)
  System
define
  \insert lazy_execution.oz

  % Task 4
  {System.showInfo "{GenerateOdd ~3 10} should print [∼3 ∼1 1 3 5 7 9]"}
  {System.show {GenerateOdd ~3 10}.1}

  {System.showInfo "{GenerateOdd 3 3} should print [3]"}
  {System.show {GenerateOdd 3 3}.1}

  {System.showInfo "{GenerateOdd 2 2} should print nil"}
  {System.show {GenerateOdd 2 2}}

  /* Task 4
    Lazy execution makes sure that nothing is generated until it is explicitly being used.
    For example '{GenerateOdd ~3 10}' will just return the function, but '{GenerateOdd ~3 10}.1'
    will generate, then return the first element of the list, which is ~3. This allows for
    resources not being spent unecessary and only when it is needed and asked for.

    With task 3, when it is supposed to sum up all the odd numbers between 0 and 1000 it will
    not be as quick as the eager version, as written in task 1. This is due that for each call
    of the next element the '{Product X}' function will ask for has to be triggered by the lazy
    function, making it one extra call for the next element. Making about 500 more calls than it
    would than in task 1.
   */

  {Exit 0}
end
