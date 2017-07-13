defmodule Pingpong.Ping do

  def start do
    loop()
  end

  def loop do
    receive do
      {:ping, pid} -> 
        IO.puts "ping -> "
        send(pid, {:pong, self()})
    end
    loop()
  end
      
end
