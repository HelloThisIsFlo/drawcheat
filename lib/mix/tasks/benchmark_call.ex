defmodule Mix.Tasks.DrawSomething.BenchmarkCall do
  use Mix.Task

  ~S"""
  Notes:
  Before any genserver: Reading file each time
  1.55 seconds

  After genserver: Reading file once
  1.48 - 2.23 seconds

  After distributed load: Reading file once and splitting between workers
  enter result
  """

  def run(_args) do
    DrawSomething.Dictionary.start_link

    Enum.each(1..30, fn(_n) -> print_result end)
  end

  def print_result do
    duration = Benchmark.measure(fn ->
      DrawSomething.Magic.cheat("hellosdfwwer", 5)
    end)
    IO.puts "#{duration} seconds"
  end

end
