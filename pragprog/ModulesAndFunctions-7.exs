IO.puts :io_lib.format("~.2f", [10.12])

IO.puts System.get_env("HOME")

IO.puts Path.extname("./ModulesAndFunctions-7.exs")

IO.puts elem(File.cwd(), 1)
# or
File.cwd()
|> elem(1)
|> IO.puts

#json = "{'hello': 'world'}"

IO.puts elem(System.cmd("date", []), 0)


