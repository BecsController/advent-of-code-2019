inputs = File.open("day_one_inputs.txt").read.split("\n").map(&:to_i)
$each_input = []
$sum = []

def start(input)
  $each_input << fuel_counter_upperer(input)
  fuel_check($each_input.last)
  each_fuel_total
end

def fuel_check(fuel)
  if (fuel_counter_upperer(fuel) > 0)
    $each_input << fuel_counter_upperer(fuel)
    fuel_check($each_input.last)
  end
end

def fuel_counter_upperer(mass)
  mass / 3.floor - 2
end

def each_fuel_total
  sum = $each_input.sum
  $sum << sum
  $each_input = []
end

inputs.map{ |i| start(i) }

puts $sum.sum
