defmodule DrawSomething do
  use Application

  def start(_type, _args) do
    DrawSomething.Supervisor.start_link
  end





end
