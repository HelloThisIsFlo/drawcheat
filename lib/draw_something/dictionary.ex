defmodule DrawSomething.Dictionary do
  @moduledoc ~S"""
  Defines operations on a file containing a list of words.

  The words need to be separated by the `newline` character: `\\n`
  """

  @path Application.fetch_env!(:draw_something, :dict_path)

  def words do
    @path
    |> File.read!
    |> split_on_newline
  end

  def count_lines do
    words
    |> count_lines
  end
  def count_lines(lines) when is_list(lines), do: length(lines)

  defp split_on_newline(text), do: String.split(text, "\n", trim: :true)
end
