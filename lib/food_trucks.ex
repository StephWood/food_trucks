defmodule FoodTrucks do
  alias Trucks
  alias FoodTrucks.Filter

  def get_truck_data() do
    Trucks.get_truck_data()
  end

  def get_filtered_trucks(trucks, input) do
    Trucks.get_filtered_trucks(trucks, input)
  end

  def new_filter() do
    Filter.new()
  end
end
