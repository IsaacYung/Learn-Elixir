defmodule Alpha.RouterTest do
  use ExUnit.Case, async: true

  @tag :distributed
  test "route requests across nodes" do
    assert Alpha.Router.route("hello", Kernel, :node, []) ==
      :"foo@isaac-desktop"
    assert Alpha.Router.route("world", Kernel, :node, []) ==
      :"bar@isaac-desktop"
  end

  test "raises on unknown entries" do
    assert_raise RuntimeError, ~r/could not find entry/, fn ->
      Alpha.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end
