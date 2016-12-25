defmodule DrawSomething.Dictionary.Crawler do
  use GenServer
  alias DrawSomething.Dictionary
  import DrawSomething.Words

  @doc """
  Start a dictionary crawler the will crawl words between indexes `start_index` and `end_index`
  """
  def start_link start_index, end_index do
    GenServer.start_link __MODULE__, {start_index, end_index}
  end

  def words(pid), do: GenServer.call pid, :words
  def range(pid), do: GenServer.call pid, :range
  def find_all_possible_words(pid, letters), do: GenServer.call pid, {:find_words, letters}

  ############################################
  #####       GenServer callbacks      #######
  ############################################

  def init({start_idx, end_idx}) do
    state = [words: Dictionary.words(start_idx, end_idx), range: start_idx..end_idx]
    {:ok, state}
  end

  def handle_call(:words, _from, [words: words, range: _] = state) do
    {:reply, words, state}
  end
  def handle_call(:range, _from, [words: _, range: range] = state) do
    {:reply, range, state}
  end

  def handle_call({:find_words, letters}, _from, [words: words, range: _] = state) do
    possible_words = words |> Enum.filter(&(can_be_written_with(&1, letters)))
    {:reply, possible_words, state}
  end


end
