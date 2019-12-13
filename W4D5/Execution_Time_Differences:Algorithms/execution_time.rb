def my_min(list)
    min = list[0]
    list.each_with_index do |el, i|
        current_min = el
        list.each_with_index do |el2, i2|
            if i2 > i && el2 < el
                current_min = el2
            end
        end
        min = current_min if current_min < min
    end
    min
end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)
# time complexity O(n^2)

def my_min2(list)
    min = list[0]
    list.each do |el|
        min = el if el < min
    end
    min
end

# p my_min2(list)
# time complexity O(n)

def largest_contiguous_subsum(list)
    new_arr = []
    (0...list.length - 1).each do |i|
        (i...list.length).each do |j|
            new_arr << list[i..j]
        end
    end
    new_arr.map { |sub_arr| sub_arr.sum }.max
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

#time complexity O(n^3)
#space complexity O(n^3)

def largest_contiguous_subsum2(list)
    largest_sum = list[0]
    current_sum = 0
# list = [2, 3, -6, 7, -6, 7]
    list.each do |number|
        current_sum += number
        if current_sum > largest_sum
            largest_sum = current_sum
        elsif current_sum < 0
            current_sum = 0
        end
    end
    largest_sum
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

# list = [1, -2, 3, 15, -8, 12, -24, -13] # => 22
# p largest_contiguous_subsum(list)
#O(n) 
#O(1)