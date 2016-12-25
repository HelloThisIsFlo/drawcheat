defmodule Benchmark do

  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  """
  Notes:

  Before any genserver: Reading file each time
  1.28 seconds

  After genserver: Reading file once
  enter result

  After distributed load: Reading file once and splitting between workers
  enter result

  """


end
