defmodule MiniCraft.Server do
  use GenServer

  alias Minicraft.BoardCore

  @impl true
  def init(_answer) do
  {:ok, BoardCore.new()}
  end

  @impl true
  def handle_call({:move, guess}, _from, board) do
    newboard = BoardCore.move(board, guess)
    {:reply, newboard |> BoardCore.render(), newboard}
  end
end
