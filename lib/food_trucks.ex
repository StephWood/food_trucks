defmodule FoodTrucks do
  # import data file
  @truck_data "./assets/truck_data.csv"

  # get data for trucks that are approved. Assumption that we don't need to know about trucks that don't have a permit.
  def get_truck_data() do
    File.read!(@truck_data)
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ","))
    |> Enum.filter(fn
        ["locationid" | _] -> false
        [_, _, _, _, _, _, _, _, _, _, "REQUESTED" | _] -> false
        [_, _, _, _, _, _, _, _, _, _, "EXPIRED" | _] -> false
        [_, _, _, _, _, _, _, _, _, _, "SUSPEND" | _] -> false
        [_, _, _, _, _, _, _, _, _, _, "ISSUED" | _] -> false
        _ -> true
    end)
  end

  def get_trucks(input) do
    get_truck_data()
    |> Enum.filter(fn [_, _, _, _, _, _, _, _, _, _, _, f | _] -> String.contains?(String.downcase(f), String.downcase(input)) end)
  end
end
