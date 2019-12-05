object Task2 extends App {
  /**
   * Task2 a)
   */
  def initThread(runnable: () => Unit): Thread = {
    return new Thread {
      override def run(): Unit = {
        runnable();
      }
    }
  }

  /**
   * Task2 b)
   * The program regurarly prints 1 instead of 2,
   * which does not correspond with the order the threads were started in.
   *
   * The phenomenon is called Race Condition. It happens when one process is dependant on other events,
   * but their timing is not controlled and may happen in a different order. In our case, the first or second thread
   * ran after the third.
   *
   * We decided to use Vipps as a domain for our example:
   * If a user tries to make two simultaneous payments, it is important that the first transaction finishes before
   * the second. In this case, the second transaction must read the balance after the first transaction has
   * deducted money from it. If this order is not assured, both transactions could end up reading the same balance.
   * E.g. a user with 150 kroners can send 100 kroners twice, even though the balance is too low.
   */

  private var counter: Int = 0

  def increaseCounter(): Unit = this.synchronized {
    counter += 1
  }
  def printCounter(): Unit = {
    println(counter)
  }

  // Uncomment to print the result
  /*
  initThread(increaseCounter).start()
  initThread(increaseCounter).start()
  initThread(printCounter).start()
  */

  /**
   * Task2 c)
   * We added this.synchronized to the increaseCounter function
   */

  /**
   * Task2 d)
   * A deadlock is a situation that can occur when two or more executions
   * are waiting for each other before being able to proceed with their
   * own actions.
   * A deadlock can occur if all the following conditions are met
   * 1. Preventing mutual exclusion: Disalllow simultaneous access to the same resource
   * 2. Hold an wait: All proccess has to request access to the resource before it can continue
   * 3. No pre-emption: No proccess can be forced to release a resource
   * 4. Circular wait: A process is waiting for a resource that is witheld by another process
   * Removing one of these four conditions will prevent a deadlock from occurring.
   */

  /**
   * Deadlock example
   */

  object One {
    lazy val one: Int = 1
    lazy val two: Int = Two.one
  }

  object Two {
    lazy val one: Int = One.one
  }

  val threadOne = initThread(() => {
    println("Thread one")
    println(One.two)
  })

  val threadTwo = initThread(() => {
    println("Thread two")
    println(Two.one)
  })

  /**
   * These threads might print the values 1, but most of the time
   * the threads enter a deadlock state and execution halts.
   * Which results in the user having to force exit the program.
   */
  // Uncomment to see the deadlock
  /*
  threadOne.start()
  threadTwo.start()
  */
}
