functor
import
  Application(exit:Exit)
  System
  OS
define
  \insert bounded_buffer.oz

  % Task 5a
  local HammerTime B Start End in
    Start = {Time.time}
    HammerTime = {HammerFactory}
    B = HammerTime.2.2.2.1
    End = {Time.time}
    {System.showInfo "Approximately "#End-Start#" seconds elapsed for task 5a"}
    {System.show HammerTime}
  end


  % Task 5b
  local HammerTime Consumer Start End in
    Start = {Time.time}
    HammerTime = {HammerFactory}
    Consumer = {HammerConsumer HammerTime 10}
    End = {Time.time}
    {System.showInfo "Approximately "#End-Start#" seconds elapsed for task 5b"}
    {System.show Consumer}
  end


  % Task 5c
  local HammerStream Buffer Consumer Start End in
    Start = {Time.time}
    HammerStream = {HammerFactory}
    Buffer = {BoundedBuffer HammerStream 6}
    {Delay 6000}
    Consumer = {HammerConsumer Buffer 10}
    End = {Time.time}
    {System.showInfo "Approximately "#End-Start#" seconds elapsed for task 5c with bounded buffer"}
    {System.show Consumer}
  end

  local HammerStream Consumer Start End in
    Start = {Time.time}
    HammerStream = {HammerFactory}
    {Delay 6000}
    Consumer = {HammerConsumer HammerStream 10}
    End = {Time.time}
    {System.showInfo "Approximately "#End-Start#" seconds elapsed for task 5c without bounded buffer"}
    {System.show Consumer}
  end
  
  {Exit 0}
end
