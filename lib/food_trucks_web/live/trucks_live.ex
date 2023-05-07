defmodule FoodTrucksWeb.TrucksLive do
  use Phoenix.LiveView
  import FoodTrucksWeb.CoreComponents

  def mount(_params, _session, socket) do
    trucks = FoodTrucks.get_truck_data()
    filter = FoodTrucks.new_filter()
    {:ok, assign(socket, :trucks, trucks )
    |> assign(:form, to_form(filter))
    |> assign(:desired_trucks, [])}
  end

  def handle_event("get_trucks", %{"filter" => filter}, socket) do
    desired_trucks = FoodTrucks.get_trucks(socket.assigns.trucks, filter["food"])
    {:noreply, assign(socket, :desired_trucks, desired_trucks)}
  end

end
