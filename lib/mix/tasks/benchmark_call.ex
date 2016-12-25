defmodule Mix.Tasks.DrawSomething.BenchmarkCall do
  use Mix.Task

  """
  Notes:
  Before any genserver: Reading file each time
  1.28 seconds

  After genserver: Reading file once
  1.76 seconds

  After distributed load: Reading file once and splitting between workers
  enter result
  """

  def run(_args) do
    # Mix.Task.run "app.start"

    DrawSomething.Dictionary.start_link

    duration = Benchmark.measure(fn ->
      DrawSomething.Magic.cheat("hellosdfwwer", 5)
    end)
    IO.puts "#{duration} seconds"
  end

end
