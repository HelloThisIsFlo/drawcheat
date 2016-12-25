defmodule DrawSometing.WordsTest do
  use ExUnit.Case
  import DrawSometing.Words


  test "single letter -> return letter" do
    assert [["a"]] = permutations(["a"])
  end

  test "two letters" do
    assert permutations(["a", "b"]) == [
      ["a", "b"],
      ["b", "a"]
    ]
  end

  test "three letters" do
    assert permutations(["a", "b", "c"]) == [
      ["a", "b", "c"],
      ["a", "c", "b"],
      ["b", "a", "c"],
      ["b", "c", "a"],
      ["c", "a", "b"],
      ["c", "b", "a"]
    ]
  end

  test "string instead of list" do
    assert permutations("abc") == [
      "abc",
      "acb",
      "bac",
      "bca",
      "cab",
      "cba"
    ]
  end

  ###############################
  ###     #######################
  ###############################


  test "single letter -> " do
    
  end

  # Do the opposite !!!!! -->>>> Check if a word is possible to be made with the given letters


end
