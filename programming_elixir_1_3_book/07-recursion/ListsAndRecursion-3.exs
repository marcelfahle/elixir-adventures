defmodule MyList do

  def caesar( [], _ ), do: []
  def caesar( [ head | tail ], n), do: [ char(head, n) | caesar( tail, n  ) ]

  defp char(el, n) when el + n > ?z, do: el + n - 26
  defp char(el, n), do: el + n



  # grab the string, turn into list
  # recursive walk through
  # increment each number by n
  # if 
  
end
