defmodule ReplUtil do
  alias DrawSomething.Dictionary
  alias DrawSomething.Dictionary.Coordinator


  def crawlers do
    Enum.each Coordinator.crawlers, fn({pos, pid}) ->
      IO.inspect pos
      IO.inspect pid
      IO.inspect Dictionary.Crawler.range pid
    end
  end


end
