defmodule DrawSomething.DictionaryTest do
  use ExUnit.Case
  alias DrawSomething.Dictionary

  test "read test file" do
    words = Dictionary.words
    assert words == [
      "bob",
      "bobby",
      "hi",
      "this",
      "is",
      "another",
      "test",
      "I",
      "needed",
      "to",
      "make",
      "the",
      "list",
      "a",
      "bit",
      "longer"]
  end

  test "get sub-set of words" do
    assert ["bobby", "hi"] == Dictionary.words(1,2)
  end

  test "count lines" do
    assert 16 == Dictionary.count_lines
  end

end
