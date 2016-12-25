defmodule DrawSomething.DictionaryTest do
  use ExUnit.Case
  alias DrawSomething.Dictionary

  setup do

    Dictionary.start_link

    :ok
  end


  test "read test file" do
    words = Dictionary.words
    assert ["bob", "bobby", "hi"] = words
  end

  test "count lines" do
    assert 3 == Dictionary.count_lines
  end

end
