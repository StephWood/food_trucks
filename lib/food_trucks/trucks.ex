defmodule Trucks do
   # import data file
   @truck_data "./assets/truck_data.csv"

   # get data for trucks that are approved. Assumption that we don't need to know about trucks that don't have a permit.
   def get_truck_data() do
     File.read!(@truck_data)
     |> String.split("\n")
     |> Enum.map(&String.split(&1, ","))
     |> Enum.map(fn l -> fix_names(l) end)
     |> Enum.filter(fn
         ["locationid" | _] -> false
         [_, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true
         _ -> false
     end)
   end

   def fix_names(list) do
    if length(list) == 31 do
      name = Enum.at(list, 1) <>","<>Enum.at(list, 2)
      list |> List.delete_at(2) |> List.replace_at(1, name)
    else
      list
    end
   end

   def get_trucks(trucks, input) do
     trucks
     |> Enum.filter(fn [_, _, _, _, _, _, _, _, _, _, _, f | _] -> String.contains?(String.downcase(f), String.downcase(input)) end)
     |> Enum.take(2)
   end
 end
