defmodule BirdCount do
  def today([head | _tail]), do: head
  def today([]), do: nil

  def increment_day_count([head | tail]), do: [head + 1 | tail]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?(list), do: 0 in list

  def total(list) do
    list
    |> Enum.sum
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn day -> day >= 5 end)
    |> Enum.count
  end
end
