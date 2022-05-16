defmodule BirdCount do
  def today([head | _tail]), do: head
  def today([]), do: nil

  def increment_day_count([head | tail]), do: [head + 1 | tail]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?(list), do: 0 in list

  def total(list) do
    total(list, 0)
  end

  defp total([head | tail], acc) do
    total(tail, acc + head)
  end

  defp total([], acc), do: acc

  def busy_days(list) do
    list
    |> filter_list(fn day -> day >= 5 end)
    |> reverse()
    |> list_length()
  end

  defp list_length(list) do
    list_length(list, 0)
  end

  defp list_length([_head | tail], acc), do: list_length(tail, acc + 1)
  defp list_length([], acc), do: acc

  defp filter_list(list, predicate), do: filter_list(list, predicate, [])
  defp filter_list([head | tail], predicate, accumulator) do
    case predicate.(head) do
      true -> filter_list(tail, predicate, [head | accumulator])
      false -> filter_list(tail, predicate, accumulator)
    end
  end
  defp filter_list([], _predicate, accumulator), do: accumulator

  defp reverse(list), do: reverse(list, [])
  defp reverse([head | tail], list), do: reverse(tail, [head|list])
  defp reverse([], list), do: list
end
