defmodule TrucksTest do
  alias Trucks
  use ExUnit.Case

  setup do
    [trucks: Trucks.get_truck_data()]
  end

  test "should return only approved trucks from csv file", context do
    bad_results = Enum.reject(context.trucks, (fn [_, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true end))
    assert length(bad_results) == 0
  end

  test "should return a reduced list of trucks based on food filter input", context do
    filtered_trucks = Trucks.get_filtered_trucks(context.trucks, "tea")
    assert length(filtered_trucks) < length(context.trucks)
  end
end
