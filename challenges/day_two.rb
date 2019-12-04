$input = File.open("day_two_input.txt").read.split(",").map(&:to_i)
$idx = 0

def find_addends(opcode)
  if opcode != 99
    opcode(opcode, $input[$idx + 1], $input[$idx + 2], $input[$idx + 3])
  else
    terminate
  end
end

def opcode(code, d_one, d_two, position)
  if code == 1
    $input[position] = $input[d_one] + $input[d_two]
  else
    $input[position] = $input[d_one] * $input[d_two]
  end
  $idx += 4
  find_addends($input[$idx])
end

def terminate
  print $input
end

find_addends($input.first)
