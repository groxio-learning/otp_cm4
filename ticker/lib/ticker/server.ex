defmodule Ticker.Server do
  use GenServer

  alias Ticker.MapCore

  @impl true
  def init(input) do
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
  def start() do
    {:ok, _pid} = GenServer.start_link(__MODULE__, "42")
  end
end
