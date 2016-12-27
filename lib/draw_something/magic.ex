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

  def cheat_old(letters) do
    Dictionary.words
    |> Enum.filter(&(can_be_written_with(&1, letters)))
  end

  def cheat_old_task(letters) do
    Dictionary.words
    |> Enum.map(fn(w) -> Task.async(fn -> {w, can_be_written_with(w, letters)} end) end)
    |> Enum.map(fn(task) -> Task.await(task) end)
    |> Enum.filter(fn({_, keep}) -> keep == :true end)
    |> Enum.map(fn({word, _}) -> word end)
  end

  def cheat_old_stream(letters) do
    Dictionary.words
    |> Stream.map(fn(w) -> Task.async(fn -> {w, can_be_written_with(w, letters)} end) end)
    |> Stream.map(fn(task) -> Task.await(task) end)
    |> Stream.filter(fn({_, keep}) -> keep == :true end)
    |> Stream.map(fn({word, _}) -> word end)
    |> Enum.to_list
  end

  def bench(:normal) do
    f = fn -> cheat("asdfasdf") end
    bench(f)
  end
  def bench(:old) do
    f = fn -> cheat_old("asdfasdf") end
    bench(f)
  end
  def bench(:task) do
    f = fn -> cheat_old_task("asdfasdf") end
    bench(f)
  end
  def bench(:stream) do
    f = fn -> cheat_old_stream("asdfasdf") end
    bench(f)
  end
  def bench(func) when is_function(func), do: Benchmark.measure(func)

end
