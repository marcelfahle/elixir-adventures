defmodule WikiDream.CLI do
  def main(args) do
    parse_args(args)
    |> process
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, 
                               switches: [help: :boolean],
                               aliases: [h: :help])
    case parse do
      {[help: true], _, _}
        -> :help
      {_, [search_term], _}
        -> {search_term}
    end
  end

  def process( {search_term} ) do
    WikiDream.JSONFetch.fetch(search_term)
    |> WikiDream.ExtractMap.extract_from_body
    |> string_format
  end

  def process(:help) do
    IO.puts """
      Wiki Dream
      -------
      usage: wiki_dream <search_term>
      example: wiki_dream lion
    """
  end

  def string_format(string) do
    String.replace(string, ". ", ". \n")
    |> IO.puts
  end
end
