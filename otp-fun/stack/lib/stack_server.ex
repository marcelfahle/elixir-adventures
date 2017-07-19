defmodule StackServer do
  use GenServer

  # api

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :stack_server)
  end

  def pop do
    GenServer.call(:stack_server, :pop)
  end

  def push(val) do
    GenServer.cast(:stack_server, {:push, val})
  end

  def list do
    GenServer.call(:stack_server, :list)
  end


  # Callbacks

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
