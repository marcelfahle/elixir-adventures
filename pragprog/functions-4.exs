prefix = fn p -> fn name -> "#{p} #{name}" end end

mrs = prefix.("Mrs")
IO.puts mrs.("Fahle")

IO.puts prefix.("Elixir").("rocks")
