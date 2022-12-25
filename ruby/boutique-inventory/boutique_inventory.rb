class BoutiqueInventory
  CHEAP_THRESHOLD = 30.0

  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |i| i[:name] }.sort
  end

  def cheap
    @items.filter { |i| i[:price] < CHEAP_THRESHOLD }
  end

  def out_of_stock
    @items.filter { |i| i[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    @items.find { |i| i[:name] == name }[:quantity_by_size]
  end

  def total_stock
    @items.map { |i| i[:quantity_by_size].reduce(0) { |sum, (_key, value)| sum + value } }.reduce(0, :+)
  end

  private

  attr_reader :items
end
