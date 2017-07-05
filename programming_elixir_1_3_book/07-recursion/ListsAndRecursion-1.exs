defmodule MyList do
  
  def mapsum(list, func), do: mapsum(list, func, 0)
  def mapsum([], _func, total), do: total
  def mapsum([head | tail], func, total), do: mapsum(tail, func, func.(head) + total)

end
