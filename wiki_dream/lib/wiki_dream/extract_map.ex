defmodule WikiDream.ExtractMap do
  def extract_from_body(map) do
    {:ok, body} = map

    extract_article = get_in(body, ["query"])
    |> get_in(["pages"])
    |> Enum.find(fn {key, _value} ->
        case Integer.parse(key) do
          :error -> false
          _ -> key
        end
      end)

      {_, extract_article_content} = extract_article
      Map.fetch!(extract_article_content, "extract")
  end
end
