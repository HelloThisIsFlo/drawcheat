defmodule DrawSomething.Dictionary.Crawler do
  use GenServer
  alias DrawSomething.Dictionary

  @doc """
  Start a dictionary crawler the will crawl words between indexes `start_index` and `end_index`
  """
  def start_link start_index, end_index do
    GenServer.start_link __MODULE__, {start_index, end_index}
  end

  def words(pid) do
    GenServer.call pid, :words
  end

  ############################################
  #####       GenServer callbacks      #######
  ############################################

  def init({start_idx, end_idx}) do
    {:ok, Dictionary.words(start_idx, end_idx)}
  end

  def handle_call(:words, _from, state) do
    {:reply, state, state}
  end
end
