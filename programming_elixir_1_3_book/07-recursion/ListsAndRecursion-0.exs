defmodule MyList do

  def sum(list), do: _sum(list, 0)
  defp _sum([], current), do: current
  defp _sum([head | tail], current), do: _sum(tail, current+head)


  def sum1([head | []]), do: head
  def sum1([head | [next_head | tail]]), do: sum1([head + next_head | tail])
  
end
