defmodule Minicraft do
  def new(name) do
    DynamicSupervisor.start_child(:sup, {Minicraft.Server, name})
  end

  def move(name, guess) do
    Minicraft.Server.move(name, guess)
  end
end
