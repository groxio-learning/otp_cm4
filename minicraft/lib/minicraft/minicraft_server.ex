defmodule Minicraft.Server do
  use GenServer

  alias Minicraft.BoardCore

  # server callbacks

  @impl true
  def init(_answer) do
  {:ok, BoardCore.new()}
  end

  @impl true
  def handle_call({:move, guess}, _from, board) do
    newboard = BoardCore.move(board, guess)
    {:reply, newboard |> BoardCore.render(), newboard}
  end

  def child_spec(name) do
    %{id: name, start: {Minicraft.Server, :start_link, [name]}}

  end

   # Client API
   # Start the server
  def start_link(name) do
    IO.puts "Starting #{name}"
    {:ok, _board} = GenServer.start_link(__MODULE__,name, name: name)
  end

   def move(board \\ __MODULE__, guess) do
    GenServer.call(board, {:move, guess})
    |> IO.puts
  end
end
