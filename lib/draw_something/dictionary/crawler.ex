defmodule DrawSomething.Dictionary.Crawler do
  use GenServer
  alias DrawSomething.Dictionary

  @doc """
  Start a dictionary crawler the will crawl words between indexes `start_index` and `end_index`
  """
  def start_link start_index, end_index do
    GenServer.start_link __MODULE__, {start_index, end_index}
  end

  def words(pid), do: GenServer.call pid, :words
  def range(pid), do: GenServer.call pid, :range

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


end
