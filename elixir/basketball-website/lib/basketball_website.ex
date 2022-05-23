defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    |> Enum.reduce(data, fn x, acc -> acc[x] end)
  end

  def get_in_path(data, path) do
    path_list = String.split(path, ".")
    get_in(data, path_list)
  end
end
