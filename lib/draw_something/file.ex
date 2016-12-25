defmodule DrawSomething.File do

  def read_all(path) do
    path
    |> File.read!
    |> split_on_newline
  end

  defp split_on_newline(text) do
    String.split text, "\n", trim: true
  end






end
