defmodule DrawSomething.Dictionary.CoordinatorTest do
  use ExUnit.Case
  alias DrawSomething.Dictionary
  alias DrawSomething.Dictionary.Coordinator

  test "correct number of crawlers" do
    # for info
    assert 16 == Dictionary.word_count

    # There are 5 words per crawler in test config (see config file)
    # 5 words per crawler, 16 words => 4 Crawlers. (1 with only one word)
    assert Coordinator.number_of_crawlers == 4
  end

  test "keep track of new process after crash", context do
    IO.puts "\n TODO #{context.test}"
  end

  test "get all with words in different crawlers" do
    words = Coordinator.get_all_possible_words("testi")
    assert words == ["is", "test", "i"]
  end

end
