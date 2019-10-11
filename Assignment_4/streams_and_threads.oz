fun {GenerateOdd S E}
  if {Int.isOdd S} then
    if E >= S then
      S|{GenerateOdd S+2 E}
    else
      nil
    end
  else
    if E > S then
      {GenerateOdd S+1 E}
    else
      nil
    end
  end 
end

fun {Product S}
  case S of Head|Tail then
    Head*{Product Tail}
  else
    1
  end
end
