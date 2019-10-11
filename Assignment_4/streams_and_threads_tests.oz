functor
import
  Application(exit:Exit)
  System
define
  \insert streams_and_threads.oz

  % Task 1
  {System.showInfo "{GenerateOdd ~3 10} should print [∼3 ∼1 1 3 5 7 9]"}
  {System.show {GenerateOdd ~3 10}}

  {System.showInfo "{GenerateOdd 3 3} should print [3]"}
  {System.show {GenerateOdd 3 3}}

  {System.showInfo "{GenerateOdd 2 2} should print nil"}
  {System.show {GenerateOdd 2 2}}

  % Task 2
  {System.showInfo "{Product [1 2 3 4]} should print 24"}
  {System.show {Product [1 2 3 4]}}

  % Task 3
  local OneThousandOdd in
    thread OneThousandOdd = {GenerateOdd 0 1000} end
    thread {System.show {Product OneThousandOdd}} end
  end

  /*
    - The first three numbers of the operation is 100
    - There are several benefits of running the operation on threads.
      Other processes that do not rely on the thread can run
      and calculate separately besides the thread.
      Adding several threads is called concurrent programming. The second
      thread will not start until any variables are bound
   */

  {Exit 0}
end
