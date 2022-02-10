defmodule MiniCraft.Score do

  defstruct [:red, :white]

  def new(answer, guess) do
    count = 4
    red = red_count(answer, guess)
    misses = miss_count(answer, guess)
    white = count - red - misses
    %__MODULE__{red: red , white: white}
  end

  def check(answer, guess) do
     answer
     |> new(guess)
     |> render()
  end

  def render(%{red: red, white: white}) do
    String.duplicate("R", red)  <> String.duplicate("W", white)
  end

  defp red_count(answer, guess) do
    answer |> Enum.zip(guess) |> Enum.filter(fn {x,y} -> x == y end)|> Enum.count()
  end

  defp miss_count(answer, guess) do
    ( guess -- answer ) |> Enum.count()
  end

end
