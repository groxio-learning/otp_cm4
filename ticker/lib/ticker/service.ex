defmodule Ticker.Service do
  alias Ticker.MapCore

  def start(input) do
    counter = MapCore.new(input)
    spawn(fn -> loop(counter) end)
  end

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
