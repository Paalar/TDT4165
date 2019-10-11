fun {RandomInt Min Max}
  X = {OS.rand}
  MinOS
  MaxOS
in
  {OS.randLimits ?MinOS ?MaxOS}
  Min + X*(Max - Min) div (MaxOS - MinOS)
end

fun lazy {HammerFactory}
  IsDefect = {RandomInt 0 10} == 1
in
  {Delay 1000}
  if IsDefect then
    'defect'|{HammerFactory}
  else
    'working'|{HammerFactory}
  end
end

fun {HammerConsumer HammerStream N}
  if N == 0 then
    0
  else
    case HammerStream of Head|Tail then
      if Head == 'working' then
        1 + {HammerConsumer Tail N-1}
      else
        {HammerConsumer Tail N-1}
      end
    end
  end
end

fun {BoundedBuffer HammerStream N} % Function as defined in 5c
  Buffer = thread {List.drop HammerStream N} end % Creates a variable, Buffer, which is a stream of N elements

  fun lazy {BufferStream HammerStream Buffer} % Function that returns an element when asked for, and asks the stream for a new element
    case HammerStream of Hammer|Stream then % Gets the hammer as well as the stream function from the HammerStream
      Hammer|{BufferStream Stream thread Buffer.2 end} % Returns the hammer, as well as generates a new hammer from the factory
    end
  end
  
in
  {BufferStream HammerStream Buffer} % Calls the buffer stream function
end
