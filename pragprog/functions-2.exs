func2 = fn 
  ( 0, 0, _ ) -> "FizzBuzz"
  ( 0, _, _ ) -> "Fizz"
  ( _, 0, _ ) -> "Buzz"
  ( _, _, a ) -> a
end

func3 = fn n -> func2.( rem(n, 3), rem(n, 5), n ) end

IO.puts func2.(0, 0, "")
IO.puts func2.(0, "", "")
IO.puts func2.("", 0, "")
IO.puts func2.("", "", "last")

IO.puts "======="

IO.puts func3.(10)
IO.puts func3.(11)
IO.puts func3.(12)
IO.puts func3.(13)
IO.puts func3.(14)
IO.puts func3.(15)
IO.puts func3.(16)

