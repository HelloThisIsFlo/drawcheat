defmodule DrawSomething.MagicTest do
  use ExUnit.Case
  import DrawSomething.Magic

  # These tests rely on the fact that the test.txt file contains:
  # - bob
  # - bobby
  # - hi

  test "happy path" do
    assert cheat("xxxxhixxxx") == ["hi"]
    assert cheat("bobby") == ["bob", "bobby"]
  end

  test "one letter missing" do
    assert cheat("boby") == ["bob"]
  end

  test "specific length required" do
    assert cheat("bobby", 3) == ["bob"]
  end

end
