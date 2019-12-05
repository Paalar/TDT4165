functor
import
    Application(exit:Exit)
    System
    Space
define
    \insert 'solve.oz'
    \insert 'database.oz'

    % Task 1
  
    {System.showInfo "Solves one path from Cabin 1 to 6"}
    {System.show {SolveOne {Plan 1 6}}}

    {System.showInfo "Returns all possible paths from cabin 1 to cabin 3"}
    {System.show {SolveAll {Plan 1 3}}}

    {System.showInfo "Returns the best possible path from cabin 1 to cabin 3"}
    {System.show {BestPlan 1 3}}
    {Exit 0}
end
