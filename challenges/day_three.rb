$input = File.open("day_three_input.txt").read.split("\n").map{|s| s.split(",")}
$centralPort = [0, 0]
$path = []
$result_one = []
$result_two = []
$line_position

def get_paths
  path_one = convert_directions($input[0])
  path_two = convert_directions($input[1])

  $result_one = convert_path(path_one)
  reset_path
  reset_central_port

  $result_two = convert_path(path_two)
  reset_path
  find_intersections(result_one, result_two)
end

def convert_directions(line)
  path = []
  line.each do |i|
    obj = { direction: i[0], distance: i.slice(1..i.length) }
    path.push(obj)
  end
  path
end

def reset_central_port
  $centralPort = [0, 0]
end

def reset_path
  $path = []
end

def convert_path(path)
  $line_position = $centralPort
  path.each do |d|
    find_new_position(d)
  end
end

def find_new_position(instructions)
  direction, distance = instructions.slice(:direction, :distance).values
  distance = distance.to_i
  case direction
  when "R"
    counter = 0
    destination = $line_position[0]
    while counter != distance
      $path << [destination, $line_position[1]]
      destination += 1
      counter += 1
    end
    $line_position[0] = destination
  when "L"
    counter = distance
    destination = $line_position[0]
    while counter != 0
      $path << [destination, $line_position[1]]
      destination -= 1
      counter -= 1
    end
    $line_position[0] = destination
  when "U"
    counter = 0
    destination = $line_position[1]
    while counter != distance
      $path << [$line_position[0], destination]
      destination += 1
      counter += 1
    end
    $line_position[1] = destination
  when "D"
    counter = distance
    destination = $line_position[1]
    while counter != 0
      $path << [$line_position[0], destination]
      destination -= 1
      counter -= 1
    end
    $line_position[1] = destination
  end
end

def find_intersections(r_one, r_two)
  sums = []
  intersections = r_one.reject{ |r| !r_two.include?(r) }
  intersections.each do |i|
    sums.push(i[0].abs + i[1].abs)
  end
  print sums.slice(1..sums.length).min
end

get_paths
