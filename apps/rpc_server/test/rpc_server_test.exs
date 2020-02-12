defmodule RPCServerTest do
  use ExUnit.Case
  doctest RPCServer

  test "greets the world" do
    assert RPCServer.hello() == :world
  end
end
