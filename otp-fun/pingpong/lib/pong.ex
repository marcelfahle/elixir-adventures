defmodule Pingpong.Pong do

  def start do
    loop()
  end

  def loop do
    receive do
      {:pong, pid} ->
        IO.puts "    <- pong"
        send(pid, {:ping, self()})
    end
    loop()
  end
end
