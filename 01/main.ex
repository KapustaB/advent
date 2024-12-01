defmodule LocationListCalculator do
  def calculate_total_distance(file_path \\ "list.txt") do
     { location_list_1, location_list_2 } = read_lists_from_file!(file_path)
     total_distance_between_lists(location_list_1, location_list_2)
     |> IO.puts()
  end

  defp read_lists_from_file!(file_path) do
    File.read!(file_path)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
  end

  defp total_distance_between_lists(location_list_1, location_list_2) do
    sorted_locations = [Enum.sort(location_list_1), Enum.sort(location_list_2)]
    sorted_locations
      |> Enum.zip()
      |> Enum.map(fn {location_1, location_2} -> abs(location_1 - location_2) end)
      |> Enum.sum()
  end
end

LocationListCalculator.calculate_total_distance()
