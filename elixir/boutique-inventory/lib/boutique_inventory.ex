defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(&(update_item_name(&1, old_word, new_word)))
  end

  defp update_item_name(item, old_word, new_word) do
    item
    |> Map.update!(:name, fn name -> String.replace(name, old_word, new_word) end)
  end

  def increase_quantity(item, count) do
    updated_quantities = item.quantity_by_size
    |> Enum.into(Map.new, fn {key, val} -> {key, val + count} end)

    Map.put(item, :quantity_by_size, updated_quantities)
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_key, val}, acc -> val + acc end)
  end
end
