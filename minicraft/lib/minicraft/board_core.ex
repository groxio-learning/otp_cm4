defmodule Minicraft.Board do
  defstruct ~w[answer guesses]a
end

defmodule Minicraft.BoardCore do
  alias Minicraft.Board
  alias MiniCraft.Score

  def new(), do: %Board{answer: random(), guesses: []}

  def new(answer), do: %Board{answer: answer, guesses: []}

  def move(board, guess), do: %{board | guesses: [guess | board.guesses]}

  @max_attempts 10
  def render(board) do
    """
    #{render_results(board)}

    #{render_status(board)}
    """
  end

  defp render_results(board) do
    board.guesses
    |> Enum.map(fn guess -> render_row(board.answer, guess) end)
    |> Enum.join("\n")
  end

  defp render_status(%{answer: answer, guesses: [answer | _guesses]}), do: "Won"

  defp render_status(%{guesses: guesses}),
    do: if(length(guesses) < @max_attempts, do: "Playing", else: "Lost")

  defp render_row(answer, guess),
    do:
      "#{Enum.at(guess, 0)} #{Enum.at(guess, 1)} #{Enum.at(guess, 2)} #{Enum.at(guess, 3)} #{Score.check(answer, guess)}"

  defp random, do: 1..8 |> Enum.shuffle() |> Enum.take(4)
end
