defmodule Alpha.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = Alpha.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Alpha.Bucket.get(bucket, "milk") == nil

    Alpha.Bucket.put(bucket, "milk", 3)
    assert Alpha.Bucket.get(bucket, "milk") == 3
  end
end
