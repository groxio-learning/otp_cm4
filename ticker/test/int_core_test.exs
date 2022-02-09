defmodule TickerIntCoreTest do
  use ExUnit.Case
  doctest Ticker
  alias Ticker.IntCore

  test "test incrementer" do
    actual =
      IntCore.new("5")
      |> IntCore.inc()
      |> IntCore.inc()
      |> IntCore.dec()

    assert actual == 6
  end
end
