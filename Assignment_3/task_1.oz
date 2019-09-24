proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
  NumberOfSolutions = ((B*B) - (4.0*A*C)) % Do the calculations to find out how many solutions exists
  SquareRoot = {Float.sqrt NumberOfSolutions} % Since the square root uses the same calculation as above, use it
in
  if NumberOfSolutions >= 0.0 then % One or two real solutions exists
    RealSol = true
    X1 = ((~B + SquareRoot) / (2.0*A))
    X2 = ((~B - SquareRoot) / (2.0*A))
  else % No real solutions exists
    RealSol = false
  end
end
