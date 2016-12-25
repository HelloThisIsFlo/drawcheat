defmodule DrawSomething.Dictionary.Coordinator do
  use GenServer
  alias DrawSomething.Dictionary

  @words_per_crawler Application.fetch_env!(:draw_something, :words_per_crawler)

  def start_link do
    GenServer.start_link __MODULE__, :ok, name: __MODULE__
  end

  def number_of_crawlers, do: call :num_crawlers
  def crawlers, do: call :crawlers

  defp call(args), do: GenServer.call __MODULE__, args



  ######################################
  ####    GenServer callbacks    #######
  ######################################

  def init(:ok) do
    word_count = Dictionary.word_count

    crawlers = %{}
    |> add_full_crawlers(word_count)
    |> add_extra_crawler(word_count)

    {:ok, crawlers}
  end

  def handle_call(:num_crawlers, _from, crawlers) do
    {:reply, Enum.count(crawlers), crawlers}
  end
  def handle_call(:crawlers, _from, crawlers), do: {:reply, crawlers, crawlers}



  ################################
  ####      Private func    ######
  ################################

  defp add_full_crawlers(crawlers, word_count) do
    last_idx = num_full_crawler(word_count) - 1

    Enum.reduce(0..last_idx, crawlers, fn(position, acc) ->
      position
      |> start_crawler
      |> update_map(acc)
    end)
  end

  defp add_extra_crawler(crawlers, word_count) do
    if has_extra_crawler(word_count) do
      {:last, word_count}
      |> start_crawler
      |> update_map(crawlers)
    else
      crawlers
    end
  end

  defp num_full_crawler(word_count) do
    #TODO Check why Intege.floor_div/2 not found !!
    (word_count / @words_per_crawler)
    |> Float.floor
    |> round
  end

  defp start_crawler({:last, word_count}) do
    pid = {:last, word_count}
    |> indexes
    |> start_crawler
    position = position_last word_count
    {position, pid}
  end
  defp start_crawler(position) when is_integer(position) do
    pid = position
    |> indexes
    |> start_crawler
    {position, pid}
  end
  defp start_crawler({start_idx, end_idx}) do
    {:ok, pid} = Dictionary.Crawler.Supervisor.start_crawler(start_idx, end_idx)
    pid
  end

  defp indexes({:last, word_count}) do
    start_idx = num_full_crawler(word_count) * @words_per_crawler
    end_idx = word_count - 1
    {start_idx, end_idx}
  end
  defp indexes(position) do
    start_idx = position * @words_per_crawler
    end_idx = ((position + 1) * @words_per_crawler) - 1
    {start_idx, end_idx}
  end

  defp position_last(word_count), do: num_full_crawler(word_count)

  defp update_map({position, pid}, crawlers),
    do: Map.put crawlers, position, pid

  defp has_extra_crawler(word_count),
    do: rem(word_count, @words_per_crawler) != 0
end
