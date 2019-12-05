
class Account(val bank: Bank, initialBalance: Double) {

  class Balance(var amount: Double) {}

  val balance = new Balance(initialBalance)

  /**
   * Project Task 1.2: Implement withdraw.
   * Project Task 1.3: change return type and update function body.
   * @return The current balance of the account.
   */
  def withdraw(amount: Double): Either[Double, String] = this.synchronized {
    if (amount < 0) {
      return Right("Amount must be positive")
    }
    if (amount > this.getBalanceAmount) {
      return Right("Not enough funds")
    }
    balance.amount -= amount
    return Left(this.getBalanceAmount)
  }

  /**
   * Project Task 1.2: Implement deposit.
   * Project Task 1.3: change return type and update function body.
   * @return The current balance of the account.
   */
  def deposit (amount: Double): Either[Double, String] = this.synchronized {
    if (amount < 0) {
      return Right("Amount must be positive")
    }
    balance.amount += amount
    return Left(this.getBalanceAmount)
  }

  def getBalanceAmount: Double = {
    balance.amount
  }

  def transferTo(account: Account, amount: Double): Unit = {
    bank addTransactionToQueue (this, account, amount)
  }
}
