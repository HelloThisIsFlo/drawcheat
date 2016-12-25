defmodule DrawSomething.FileTest do
  use ExUnit.Case
  alias DrawSomething.File

  @path "./priv/test.txt"

  test "read test file" do
    words = File.read_all(@path)
    assert ["first", "second", "third"] = words
  end

  test "real file -> no exception" do
    File.read_all("./priv/words.txt")
  end

end
