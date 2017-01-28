Code.eval_file "tasks/readme.exs"

defmodule Earmark.Mixfile do
  use Mix.Project

  def project do
    [
      app:          :earmark,
      version:      "1.1.0",
      elixir:       "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      escript:       escript_config(),
      deps:          deps(),
      description:   description(),
      package:       package(),
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      { :credo,    "~> 0.4.0", only: [ :dev, :test ] },
      { :dialyxir, "~> 0.3.3", only: [ :dev, :test ] },
   ]
  end

  defp description do
    """
    Earmark is a pure-Elixir Markdown converter.

    It is intended to be used as a library (just call Earmark.as_html),
    but can also be used as a command-line tool (just run mix escript.build
    first).

    Output generation is pluggable.
    """
  end

  defp package do
    [
      files: [
        "lib", "src", "tasks", "mix.exs", "README.md"
      ],
      maintainers: [
        "Robert Dober <robert.dober@gmail.com>",
        "Dave Thomas <dave@pragdave.me>"
      ],
      licenses: [
        "Apache 2 (see the file LICENSE for details)"
      ],
      links: %{
        "GitHub" => "https://github.com/pragdave/earmark",
      }
    ]
  end

  defp escript_config do
    [ main_module: Earmark.CLI ]
  end

  defp elixirc_paths(:test), do: [ "lib", "test/support" ]
  defp elixirc_paths(_),     do: [ "lib" ]

  def x(), do: "hello"
end

Code.eval_file "tasks/docs.exs"
