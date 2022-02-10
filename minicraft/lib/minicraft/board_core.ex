defmodule Minicraft.Board do
  defstruct ~w[answer guesses]a
end

defmodule Minicraft.BoardCore do
  alias Minicraft.Board

  def new(), do: %Board{answer: random(), guesses: []}

  def move(board, guess), do: %{board | guesses: [guess | board.guesses]}

  defp random, do: 1 .. 8 |> Enum.shuffle |> Enum.take(4)

end
