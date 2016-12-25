defmodule DrawSomething.DictionaryTest do
  use ExUnit.Case
  alias DrawSomething.Dictionary

  test "read test file" do
    words = Dictionary.words
    assert ["bob", "bobby", "hi"] == words
  end

  test "get sub-set of words" do
    assert ["bobby", "hi"] == Dictionary.words(1,2)
  end

  test "count lines" do
    assert 3 == Dictionary.count_lines
  end

end
