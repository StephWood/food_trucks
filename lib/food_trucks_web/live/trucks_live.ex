defmodule FoodTrucksWeb.TrucksLive do
  use Phoenix.LiveView
  import FoodTrucksWeb.CoreComponents

  def mount(_params, _session, socket) do
    trucks = FoodTrucks.get_truck_data()
    filter = FoodTrucks.new_filter()
    {:ok, assign(socket, :trucks, trucks )
    |> assign(:form, to_form(filter))
    |> assign(:filtered_trucks, [])}
  end

  def handle_event("get_trucks", %{"filter" => filter}, socket) do
    filtered_trucks = FoodTrucks.get_filtered_trucks(socket.assigns.trucks, filter["food"])
    {:noreply, assign(socket, :filtered_trucks, filtered_trucks)}
  end

end
