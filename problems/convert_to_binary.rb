def convert_to_binary(num)
        bits = []

        while num > 0
                bits << num % 2
                num /= 2
        end

        bits.reverse.join
end

puts convert_to_binary 7
puts convert_to_binary 6
