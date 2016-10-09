defmodule Alpha.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = Alpha.Bucket.start_link
    assert Alpha.Bucket.get(bucket, "milk") == nil

    Alpha.Bucket.put(bucket, "milk", 3)
    assert Alpha.Bucket.get(bucket, "milk") == 3    
  end
end
