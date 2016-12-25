defmodule DrawSometing.Words do

  def permutations(letters) when is_bitstring(letters) do
    letters
    |> split_on_each_letter
    |> permutations
    |> join_words
  end
  def permutations([]), do: [[]]
  def permutations(list) when is_list(list) do
    for x <- list,
      perms_without_x <- permutations(list -- [x]), do: [x | perms_without_x]
  end

  defp split_on_each_letter(text), do: String.codepoints text
  defp join_words([[a]]), do: [a]
  defp join_words(permutations) do
    Enum.map permutations, fn(char_list) ->
      Enum.join char_list
    end
  end

end
