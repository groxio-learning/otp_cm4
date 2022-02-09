defmodule Ticker.IntCore do
  def new(input) do
    String.to_integer(input)
  end

  def inc(x) do
    x + 1
  end

  def dec(x) do
    x - 1
  end

  def render(acc) do
    "Counter value is: #{acc}"
  end
end
