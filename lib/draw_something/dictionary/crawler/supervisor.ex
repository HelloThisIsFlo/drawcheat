defmodule DrawSomething.Dictionary.Crawler.Supervisor do
  use Supervisor
  import Supervisor.Spec

  def start_link do
    Supervisor.start_link __MODULE__, :ok, name: __MODULE__
  end

  def start_crawler(start_idx, end_idx) do
    Supervisor.start_child __MODULE__, [start_idx, end_idx]
  end

  def init(:ok) do
    children = [
      worker(DrawSomething.Dictionary.Crawler, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

end
