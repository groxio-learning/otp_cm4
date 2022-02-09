defmodule MinicraftTest do
  use ExUnit.Case
  doctest Minicraft

  test "greets the world" do
    assert Minicraft.hello() == :world
  end
end
