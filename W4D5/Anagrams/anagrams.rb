require "byebug"

def anagram?(str_1, str_2)
    anagrams = str_1.split("").permutation
    anagrams.include?(str_2.split(""))
end

# time complexity = O(n!)

def second_anagram?(str_1, str_2)
    arr2 = str_2.split("")
    str_1.each_char do |char|
        idx = arr2.index(char)
        return false if idx.nil?
        arr2.delete_at(idx) 
    end
    arr2.empty?
end

#O(n^2)

def third_anagram?(str_1, str_2)
    arr1 = str_1.split("").sort
    arr2 = str_2.split("").sort

    arr1 == arr2
end

#O(n*log(n) + t)

def fourth_anagram?(str_1, str_2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str_1.each_char {|char| hash1[char] += 1}
    str_2.each_char {|char| hash2[char] += 1}
    
    hash1 == hash2
end
# time complexity = O(n)

def fifth_anagram?(str_1, str_2)
    hash = Hash.new(0)

    str_1.each_char {|char| hash[char] += 1}
    str_2.each_char {|char| hash[char] -= 1}
    
    hash.values.all? {|v| v == 0}
end
# time complexity = O(n)



p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
p fifth_anagram?("bye", "eyb") #=> true
#return [[]] if str_1.empty?

    # last_el = str_1[-1]
    # prev = anagram?(str_1[0...-1])

    # new_arr = []
    # prev.each do |el|
    #     # debugger
    #     (0...str_1.length).each do |i|
    #         new_arr << el[0..i] + [last_el] + el[i...-1]
    #     end
    # end
    # new_arr