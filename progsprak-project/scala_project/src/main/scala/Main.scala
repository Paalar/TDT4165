
object Main extends App {
  def thread(body: => Unit): Thread = {
    val thread = new Thread {
      override def run(): Unit = body
    }
    thread.start()
    thread
  }
}
