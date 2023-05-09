defmodule FoodTrucksWeb.TrucksLiveTest do
  use FoodTrucksWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "<h1>Food Truck Finder</h1>"
  end

  test "renders input with placeholder", %{conn: conn} do
    {:ok, _page_path, html} = live(conn, "/")

    assert html =~ "Enter your craving!"
  end

  test "renders submit button", %{conn: conn} do
    conn = get(conn, "/")
    {:ok, view, _html} = live(conn)

    assert  view |> element("button") |> has_element?()
  end

  test "submit button works", %{conn: conn} do
    conn = get(conn, "/")
    {:ok, view, _html} = live(conn)

    results = render_submit(view, "get_trucks", %{filter: %{food: "taco"}})

    assert String.contains?(results, "truck-item")
  end

end
