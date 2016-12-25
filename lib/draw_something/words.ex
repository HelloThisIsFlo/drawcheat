defmodule DrawSomething.Words do

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

  @doc ~S"""
  Check if the given word can be written with the given letters

  ## Examples
    iex> DrawSomething.Words.can_be_written_with("abc", "bac")
    :true

    iex> DrawSomething.Words.can_be_written_with("abc", "bacdfg")
    :true

    iex> DrawSomething.Words.can_be_written_with("abc", "lkjuio")
    :false
  """
  def can_be_written_with(word, available_letters) do
    word
    |> split_on_each_letter
    |> find_missing_letters(available_letters)
    |> Enum.empty?
  end

  ###################################
  ####     Private functions     ####
  ###################################

  defp find_missing_letters(word_letters, available_letters) when is_bitstring(available_letters) do
    list = available_letters
    |> split_on_each_letter

    # find_missing_letters(word_letters, list)
    find_missing_letters(word_letters, list, [])
  end

  defp find_missing_letters([], _, acc), do: acc
  defp find_missing_letters([h|t], available_letters, acc) do
    if h in available_letters do
      find_missing_letters(t, available_letters -- [h], acc)
    else
      find_missing_letters(t, available_letters, acc ++ [h])
    end
  end


  defp split_on_each_letter(text), do: String.codepoints text
  defp join_words([[a]]), do: [a]
  defp join_words(permutations) do
    Enum.map permutations, fn(char_list) ->
      Enum.join char_list
    end
  end

end
