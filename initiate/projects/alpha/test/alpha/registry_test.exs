defmodule Alpha.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    {:ok, registry} = Alpha.Registry.start_link(context.test)
    {:ok, registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert Alpha.Registry.lookup(registry, "shopping") == :error

    Alpha.Registry.create(registry, "shopping")
    assert {:ok, bucket} = Alpha.Registry.lookup(registry, "shopping")

    Alpha.Bucket.put(bucket, "milk", 1)
    assert Alpha.Bucket.get(bucket, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    Alpha.Registry.create(registry, "shopping")
    {:ok, bucket} = Alpha.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert Alpha.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    Alpha.Registry.create(registry, "shopping")
    {:ok, bucket} = Alpha.Registry.lookup(registry, "shopping")

    #Stop the bucket with non-normal reason
    Process.exit(bucket, :shutdown)

    ref = Process.monitor(bucket)
    assert_receive {:DOWN, ^ref, _, _, _}

    assert Alpha.Registry.lookup(registry, "shopping") == :error
  end
end
