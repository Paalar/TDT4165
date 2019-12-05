object Task1 extends App {
  /**
   * Task1 a)
   */
  var array = Array.empty[Int]
  for(number <- 1 to 50) {
    array = array :+ number
  }

  // Uncomment to print the result
  // The results will print all 50 elements and the length of the array
  /*
  println("Task 1 a")
  var output = s"The array contains ${array.length} elements"
  println(output)
  println("The elements of the array are:")
  array.foreach { println }
  */


  /**
   * Task1 b)
   */
  def sum(values: Array[Int]): Int = {
    var total = 0;
    for (value <- values) {
      total += value;
    }
    return total;
  }

  // Uncomment to print the result
  // Result should be 15
  /*
  var resultb = sum(Array[Int](1, 2, 3, 4, 5))
  println("Task 1 b")
  println(resultb)
  */


  /**
   * Task1 c)
   */
  def product(li: List[Int]): Int = {
    if (li.length < 2) {
      return li.head
    }
    return li.head + product(li.tail)
  }

  // Uncomment to print the result
  // The result should equal 21
  /*
  println("Task 1 c")
  var resultc = product(List(1,2,3,4,5,6))
  println(resultc)
  */


  /**
   * Task 1d)
   * Int is a 32-bit value. BigInt has a maximum value of (2^32) ^ (max array length),
   * which is much bigger than Int.
   */
  def fibonacci(N: Int): BigInt = {
    if (N <= 0) {
      return BigInt(0)
    } else if (N == 1) {
      return BigInt(1)
    } else {
      return fibonacci(N - 1) + fibonacci(N - 2)
    }
  }

  // Uncomment to print the result
  // The result should equal 75025
  /*
  println("Task 1 d")
  var resultd = fibonacci(25)
  println(resultd)
  */
}
