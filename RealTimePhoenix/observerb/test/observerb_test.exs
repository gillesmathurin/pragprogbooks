defmodule ObserverbTest do
  use ExUnit.Case
  doctest Observerb

  test "greets the world" do
    assert Observerb.hello() == :world
  end
end
