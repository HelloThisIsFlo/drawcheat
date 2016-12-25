defmodule DrawSomething.WordsTest do
  use ExUnit.Case
  import DrawSomething.Words
  doctest DrawSomething.Words

  test "can be written ? single letter" do
    assert can_be_written_with("a", "sdfg") == :false
    assert can_be_written_with("a", "sadfg") == :true
    assert can_be_written_with("a", "aaaaa") == :true
    assert can_be_written_with("a", "a") == :true
  end

  test "can be written ? multiple letter, all different" do
    assert can_be_written_with("asdf", "asdf") == :true
    assert can_be_written_with("asdf", "asssdfaaaa") == :true
    assert can_be_written_with("asdf", "bcxk") == :false
    assert can_be_written_with("asdf", "asd") == :false
  end

  test "can be written ? double letter" do
    assert can_be_written_with("hello", "ehlol") == :true
    assert can_be_written_with("hello", "ehlo") == :false
  end


  ###############################
  ###    Permutations     #######
  ###############################
  # Do the opposite !!!!! -->>>> Check if a word is possible to be made with the given letters

  test "single letter: return letter" do
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

end
