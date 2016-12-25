defmodule DrawSomething.Dictionary do
  use GenServer
  @moduledoc ~S"""
  Defines operations on a file containing a list of words.

  The words need to be separated by the `newline` character: `\\n`
  """

  @path Application.fetch_env!(:draw_something, :dict_path)
  @with_crash Application.fetch_env!(:draw_something, :with_crash)

  def start_link do
    GenServer.start_link __MODULE__, :ok, name: __MODULE__
  end

  def words do
    GenServer.call(__MODULE__, :words)
  end

  def count_lines do
    GenServer.call(__MODULE__, :count)
  end


  ######################################
  ####    GenServer callbacks    #######
  ######################################

  def init(:ok) do
    {:ok, words_from_file}
  end


  def handle_call(:words, _from, state) when @with_crash do
    IO.puts "with crash"
    if Enum.random(1..100) < 30 do
      # Crash !!
      length("asdf")
    end
    {:reply, state, state}
  end
  def handle_call(:words, _from, state), do: {:reply, state, state}

  def handle_call(:count, _from, state) do
    {:reply, state |> length, state}
  end

  defp words_from_file do
    @path
    |> File.read!
    |> split_on_newline
  end
  defp split_on_newline(text), do: String.split(text, "\n", trim: :true)
end
