defmodule LiveviewPlaygroundTest do
  use ExUnit.Case
  doctest LiveviewPlayground

  test "greets the world" do
    assert LiveviewPlayground.hello() == :world
  end
end
