defmodule StackServer do
  use GenServer

  def handle_call(:pop, _from, state) do
    {:reply, Enum.at(state, 0), Enum.drop(state, 1)}
  end

  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:push, val}, state) do
    {:noreply, [val | state]}
  end
  
end
