functor
import
  Application(exit:Exit)
  System
define
  \insert task_1.oz

  proc {PrintQuadraticEquation RealSol X1 X2}
    if RealSol then
      {System.showInfo "The equation has a real solution"}
      {System.showInfo "X1 is "#X1}
      {System.showInfo "X2 is "#X2}
    else
      {System.showInfo "The equation does not have a real solution"}
    end
  end

  local RealSol X1 X2 in % Has two solutions
    {QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2}

    {PrintQuadraticEquation RealSol X1 X2}
  end % 1a

  local RealSol X1 X2 in % Has one solution
    {QuadraticEquation 1.0 2.0 1.0 RealSol X1 X2}

    {PrintQuadraticEquation RealSol X1 X2}
  end % 1a

  local RealSol X1 X2 in % Has zero solutions
    {QuadraticEquation 1.0 2.0 2.0 RealSol X1 X2}

    {PrintQuadraticEquation RealSol X1 X2}
  end % 1a

  % 1b
  % Procedural absraction is the ability to convert any statement to a procedure
  % It allows for delaying an execution of a statement
  % It is a principle tool for building abstractions

  % 1c A function returns a value created inside the function, while a procedure executes statements

  {Exit 0}
end
