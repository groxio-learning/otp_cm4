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
    BoardCore.new()
    |> assert_guess_length(0)
    |> BoardCore.move([1, 2, 3, 4])
    |> assert_guess_length(1)
    |> BoardCore.move([7, 8, 5, 3])
    |> assert_guess_length(2)
  end

  test "test for won" do
    result = BoardCore.new([1, 2, 3, 4]) |> BoardCore.move([1, 2, 3, 4]) |> BoardCore.render()

    assert String.contains?(result, "Won")
  end

  test "test for playing" do
    result = BoardCore.new([1, 2, 3, 5]) |> BoardCore.move([1, 2, 3, 4]) |> BoardCore.render()

    assert String.contains?(result, "Playing")
  end

  test "test for Lost" do
    result =
      fn -> [1, 2, 3, 7] end
      |> Stream.repeatedly()
      |> Enum.take(10)
      |> Enum.reduce(BoardCore.new([1, 2, 3, 4]), fn guess, board ->
        BoardCore.move(board, guess)
      end)
      |> BoardCore.render()

    assert String.contains?(result, "Lost")
  end

  defp assert_guess_length(board, guess_length) do
    assert length(board.guesses) == guess_length
    board
  end
end
