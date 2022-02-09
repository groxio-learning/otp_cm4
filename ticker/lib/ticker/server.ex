defmodule Ticker.Server do
  use GenServer

  alias Ticker.MapCore

  @impl true
  def init(input) do
    IO.puts "starting with value #{input}"
    {:ok, MapCore.new(input)}
  end

  @impl true
  def handle_call(:render, _from, counter) do
    {:reply, MapCore.render(counter), counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, MapCore.increment(counter)}
  end

  @impl true
  def handle_cast(:dec, counter) do
    {:noreply, MapCore.decrement(counter)}
  end

  # Start the server
  def start_link(input) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, input, name: __MODULE__)
  end


  def inc(pid \\ __MODULE__)  do
    GenServer.cast(pid, :inc)
  end

  def dec(pid \\ __MODULE__) do
    GenServer.cast(pid, :dec)
  end

  def render(pid \\ __MODULE__) do
    GenServer.call(pid, :render)
  end
end
