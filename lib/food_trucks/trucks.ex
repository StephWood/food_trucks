defmodule Trucks do
   # import data file
   @truck_data "./assets/truck_data.csv"

   # get data for trucks that are approved. Assumption that we don't need to know about trucks that don't have a permit.
   def get_truck_data() do
     File.read!(@truck_data)
     |> String.split("\n")
     |> Enum.map(&String.split(&1, ","))
     |> Enum.filter(fn
         ["locationid" | _] -> false
         [_, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true
         [_, _, _, _, _, _, _, _, _, _, _, "APPROVED" | _] -> true
         _ -> false
     end)
   end

   def get_trucks(trucks, input) do
     trucks
     |> Enum.filter(fn [_, _, _, _, _, _, _, _, _, _, _, f | _] -> String.contains?(String.downcase(f), String.downcase(input)) end)
     |> Enum.take(2)
   end
 end

 # |> Enum.each(fn list -> List.delete_at(list, 0) end)
# end
