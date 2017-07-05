defmodule MyList do

  def max1( [] ), do: 0
  def max1( [ head | [] ] ), do: head
  def max1( list = [ head | _ ] ), do: max1( list, head )
  def max1( [ head | [] ], highest ) do
    if ( head > highest ), do: head, else: highest
  end
  def max1( [ head | tail ], highest ) do
    if (head > highest), do: max1( tail, head ), else: max1( tail, highest )
  end

  
end
