
class Bank(val allowedAttempts: Integer = 3) {

  private val transactionsQueue: TransactionQueue = new TransactionQueue()
  private val processedTransactions: TransactionQueue = new TransactionQueue()

  /**
   * Project Task 2.
   */
  def addTransactionToQueue(from: Account, to: Account, amount: Double): Unit = {
    val transaction = new Transaction(
      transactionsQueue,
      processedTransactions,
      from,
      to,
      amount,
      allowedAttempts
    )

    transactionsQueue.push(transaction)

    val thread = new Thread {
      override def run() {
        processTransactions()
      }
    }

    thread.start()
  }

  /**
   * Project Task 2.
   */
  @scala.annotation.tailrec
  private def processTransactions(): Unit = {
    val transaction = transactionsQueue.pop
    val thread = new Thread(transaction)
    thread.start()
    thread.join()
    if (transaction.status == TransactionStatus.PENDING) {
      transactionsQueue.push(transaction)
      processTransactions()
    } else {
      processedTransactions.push(transaction)
    }
  }

  def addAccount(initialBalance: Double): Account = {
    new Account(this, initialBalance)
  }

  def getProcessedTransactionsAsList: List[Transaction] = {
    processedTransactions.iterator.toList
  }
}
