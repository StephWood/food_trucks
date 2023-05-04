defmodule FoodTrucksWeb.TrucksLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    trucks = FoodTrucks.get_truck_data()
    {:ok, assign(socket, :trucks, trucks)}
  end

end
