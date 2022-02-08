defmodule Ticker.MapCore do

  def new(input), do: %{count: String.to_integer(input)}

  def increment(counter), do: %{count: counter.count + 1}

  def decrement(counter), do: %{count: counter.count - 1}

  def render(%{count: count}), do: "The current ticker value is #{count}"

end
