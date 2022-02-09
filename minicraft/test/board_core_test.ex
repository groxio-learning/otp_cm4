defmodule Minicraft.BoardCoreTest do
  use ExUnit.Case
  doctest Minicraft
  alias Minicraft.BoardCore

  test "test board core new" do
    result = BoardCore.new()
    assert result
    assert length(result.answer) == 4
    assert length(result.guesses) == 0
  end

  test "test board core move" do
    result = BoardCore.new() |> BoardCore.move([1, 2, 3, 4])
    assert result
    assert length(result.answer) == 4
    assert length(result.guesses) == 1
  end
end
