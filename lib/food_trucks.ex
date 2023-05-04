defmodule FoodTrucks do
  # import data file
  @truck_data "./assets/truck_data.csv"

  def get_truck_data() do
    File.stream!(@truck_data)
    |> Stream.map(&String.split(&1, ","))
    |> Stream.filter(fn
        ["locationid" | _] -> false
        _ -> true
    end)
  end

  def get_trucks() do
    "tacos, burritos, ice cream"
  end
end
