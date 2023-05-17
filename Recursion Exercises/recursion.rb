# Write a recursive method, range, that takes a start and an end and returns
# an array of all numbers in that range, exclusive. For example, range(1, 5) 
# should return [1, 2, 3, 4]. If end < start, return an empty array.
# Write both a recursive and an iterative method to sum an array.

#recursive method
def range(min, max)
    return [] if max == min 
   [min] + range(min+1, max)
end
#iterative method

def range_2(min, max)
    new_arr = []
    (min...max).each {|num| new_arr << num}

    new_arr

end

# p range_2(1, 5)
# p range_2(1, 6)
# p range_2(2, 10)

# Exponentiation
# Write two versions of exponent that use two different recursions:

def exp_1(b, n)
    return 1 if n == 1
    b * exp_1(b, n - 1)

end

# p exp_1(5, 0)
# p exp_1(5, 1) # = 1 
# p exp_1(5, 2) # = 5
# p exp_1(5, 3) # = 


def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0 
        exp_2(b, n/2) ** 2
        # exp_2(2, 1) ** 2
        # exp_2(2, 2) ** 2
    else 
        b * (exp_2(b, (n - 1) / 2) ** 2)
       # 2 * (exp_2(2, 1) ** 2 
    end
end

# p exp_2(2, 0) # 1
# p exp_2(2, 1) # 2
# p exp_2(2, 2) # 4
# p exp_2(2, 3) # 8
# p exp_2(2, 4) # 16

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]



class Array
    def deep_dup
        copy_arr = []
        self.each_with_index do |ele, idx|
            copy_arr += [self[idx]]
        end
        copy_arr
    end 

end

########
robot_parts = [
["nuts", "bolts", "washers"],
["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
p robot_parts[1] # => ["capacitors", "resistors", "inductors"]
p robot_parts_copy[1] #=> ["capacitors", "resistors", "inductors", "LEDs"]


#################
# example = [1, [2], [3, [4]]]
# new_example = example.deep_dup

# new_example[1] << 5

# p example # [1, [2], [3, [4]]]
# p new_example # [1, [2, 5], [3, [4]]]
