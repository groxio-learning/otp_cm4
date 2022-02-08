defmodule Ticker.MapCore do

    defstruct [count: 0]

  def new(input), do: %__MODULE__{count: String.to_integer(input)}

  def increment(counter), do: %{ counter | count: counter.count + 1}

  def decrement(counter), do: %{ counter | count: counter.count - 1}

  def render(%{count: count}), do: "The current ticker value is #{count}"

end
