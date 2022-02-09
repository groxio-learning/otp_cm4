defmodule Ticker.Service do
  alias Ticker.MapCore

  # client
  def start(input) do
    counter = MapCore.new(input)
    spawn(fn -> loop(counter) end)
  end

  def inc(counter_pid) do
    send(counter_pid, :inc)
  end

  def dec(counter_pid) do
    send(counter_pid, :dec)
  end

  def render(counter_pid) do
    send(counter_pid, {:render, self()})
    receive do
      message -> message
    end
  end

  # server
  def loop(counter) do
    counter |> listen() |> loop()
  end

  def listen(counter) do
    receive do
      :inc ->
        MapCore.increment(counter)

      :dec ->
        MapCore.decrement(counter)

      {:render, from} ->
        message = MapCore.render(counter)
        send(from, message)
        counter
    end
  end
end
