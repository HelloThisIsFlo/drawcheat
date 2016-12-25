defmodule DrawSomething.Supervisor do
  use Supervisor
  alias DrawSomething.Dictionary


  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      supervisor(Dictionary.Crawler.Supervisor, []),
      worker(Dictionary, []),
      worker(Dictionary.Coordinator, [])
    ]

    supervise(children, strategy: :one_for_one)
  end

end
