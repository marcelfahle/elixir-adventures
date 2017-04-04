defmodule WikiDream.JSONFetch do
  def fetch(search_term) do
    wiki_url(search_term)
    |> HTTPoison.get
    |> handle_json
  end

  def handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end
  def handle_json({_, %{status_code: _, body: _}}) do
    IO.puts "Something went wrong. Please check your internet connection"
  end

  defp wiki_url(search_term) do
    "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=#{search_term}"
  end


end
