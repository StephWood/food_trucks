defmodule Trucks do
   # import data file
   @truck_data "./assets/truck_data.csv"

   defstruct applicant: nil,
             address: nil,
             food: nil

   # get data for trucks that are approved. Assumption that we don't need to know about trucks that don't have a permit.
   def get_truck_data() do
     File.read!(@truck_data)
     |> String.split("\n")
     |> Enum.map(fn
        row -> String.split(row, ",")
        |> fix_names()
        |> Enum.drop(-12)
     end)
     |> Enum.filter(fn
        ["locationid" | _] -> false
        [_, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true
        [_, _, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true
        _ -> false
      end)
   end

   def fix_names(list) do
    if length(list) == 31 do
      name = Enum.at(list, 1) <>","<>Enum.at(list, 2)
      |> String.trim("\"")
      list |> List.delete_at(2) |> List.replace_at(1, name)
    else
      list
    end
   end

   def get_trucks(trucks, input) do
     trucks
     |> Enum.filter(fn [_, _, _, _, _, _, _, _, _, _, _, f | _] -> String.contains?(String.downcase(f), String.downcase(input)) end)
     |> Enum.map(fn t ->
      %Trucks{applicant: Enum.at(t, 1), address: Enum.at(t, 5), food: String.replace(Enum.at(t, 11), ":", ",")}
     end)
   end
 end
