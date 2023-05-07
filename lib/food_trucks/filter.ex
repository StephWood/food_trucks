defmodule FoodTrucks.Filter do
  defstruct [:food]

  def new() do
    filter = %__MODULE__{}
    types = %{food: :string}
    params = %{food: ""}

    Ecto.Changeset.cast({filter, types}, params, Map.keys(types))
  end
end
