input = [367479, 893698]
$winners = []

def find_combinations(input_one, input_two)
  (input_one...input_two).to_a.each do |i |
    validate_num(i)
  end
end

def validate_num(num)
  if only_inc_or_same(num)
    if has_two_adjacent_twins(num)
      $winners << num
    end
  end
end

def fugly_conversion(n)
  n.to_s.split("").map(&:to_i)
end

def has_two_adjacent_twins(num)
  bool = false
  num = fugly_conversion(num)
  num.each_with_index do |n, idx|
    if (num[idx + 1] == n)
      bool = true
    end
  end
  bool
end

def only_inc_or_same(num)
  bool = false
  num = fugly_conversion(num)
  num.each_with_index do |n, idx|
    if idx == num.length - 1
      bool = true
    elsif (num[idx + 1] < n)
      return
    end
  end
  bool
end

find_combinations(input[0], input[1])
puts $winners.count
