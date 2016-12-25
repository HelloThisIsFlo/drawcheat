defmodule DrawSomething.Magic do
  alias DrawSomething.Dictionary
  import DrawSomething.Words

  def cheat(letters, word_length) do
    letters
    |> cheat
    |> Enum.filter(&(String.length(&1) == word_length))
  end
  def cheat(letters) do
    Dictionary.Coordinator.get_all_possible_words(letters)
  end

  def print(result), do: Enum.each(result, &(IO.puts &1))

end
