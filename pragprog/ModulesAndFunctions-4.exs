defmodule Calc do
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)
end

# 5
# 1 + 2 + 3 + 4 + 5
# 5 + 4
#   + 3
#   + 2
#   + 1
