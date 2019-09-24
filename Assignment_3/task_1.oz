proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
  NumberOfSolutions = ((B*B) - (4.0*A*C))
  SquareRoot = {Float.sqrt ((B*B) - (4.0*A*C))}
in
  if NumberOfSolutions > 0.0 then % Two real solutions exists
    RealSol = true
    X1 = ((~B + SquareRoot) / (2.0*A))
    X2 = ((~B - SquareRoot) / (2.0*A))
  elseif NumberOfSolutions == 0.0 then % One real solution exists
    RealSol = true
    X1 = ((~B + SquareRoot) / (2.0*A))
    X2 = ((~B - SquareRoot) / (2.0*A))
  else % No real solutions exists
    RealSol = false
    X1 = nil
    X2 = nil
  end
end
