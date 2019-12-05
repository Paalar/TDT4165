import scala.collection.mutable.Queue
import java.util.concurrent.atomic.AtomicInteger

object TransactionStatus extends Enumeration {
  val SUCCESS, PENDING, FAILED = Value
}

/**
 * Project Task 1.
 */
class TransactionQueue {

  /**
   * Add data structure to contain the transactions.
   */
  val queue = new Queue[Transaction]()

  /**
   * Remove and return the first element from the queue.
   */
  def pop: Transaction = this.synchronized {
    return queue.dequeue
  }

  /**
   * Return whether the queue is empty
   */
  def isEmpty: Boolean = this.synchronized {
    return queue.isEmpty
  }

  /**
   * Add new element to the back of the queue.
   */
  def push(transaction: Transaction): Unit = this.synchronized {
    queue += transaction
  }

  /**
   * Return the first element from the queue without removing it.
   */
  def peek: Transaction = this.synchronized {
    return queue.head
  }

  /**
   * Return an iterator to allow you to iterate over the queue.
   */
  def iterator: Iterator[Transaction] = this.synchronized {
    return queue.iterator
  }
}

class Transaction(
  val transactionsQueue: TransactionQueue,
  val processedTransactions: TransactionQueue,
  val from: Account,
  val to: Account,
  val amount: Double,
  val allowedAttempts: Int
) extends Runnable {

  var status: TransactionStatus.Value = TransactionStatus.PENDING
  var attempt = 0

  override def run(): Unit = {
    /**
     * Project Task 3
     * Extend this method to satisfy requirements.
     *
     * Perform a transaction and handle errors accordingly.
     */
    def doTransaction(): Unit = {
      if (attempt >= allowedAttempts) {
        this.status = TransactionStatus.FAILED
      } else {
        lazy val withdrawn = from.withdraw(amount)
        lazy val deposited = to.deposit(amount)

        withdrawn match {
          case Right(error) => this.attempt += 1
          case Left(balance) => deposited match {
            // In theory, case Right should not occur in the current state of the code
            case Right(error) => this.attempt += 1
            case Left(balance) => this.status = TransactionStatus.SUCCESS
          }
        }
      }
    }

    /**
     * Project Task 3
     * Make the code below thread safe.
     */
    if (status == TransactionStatus.PENDING) this.synchronized {
      doTransaction()
      Thread.sleep(50)
    }
  }
}
