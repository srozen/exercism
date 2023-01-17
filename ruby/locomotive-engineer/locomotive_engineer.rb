class LocomotiveEngineer
  def self.generate_list_of_wagons(*list_of_wagons)
    list_of_wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first_wagon, second_wagon, third_wagon, *remaining_wagons = *each_wagons_id
    [third_wagon, *missing_wagons, *remaining_wagons, first_wagon, second_wagon]
  end

  def self.add_missing_stops(route, **route_stops)
    { **route, stops: route_stops.map { |_key, val| val } }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
