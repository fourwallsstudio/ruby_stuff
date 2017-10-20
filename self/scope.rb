puts "outside: #{self}"

class Tweet
  puts "inside class: #{self}"
end

str = <<-EOS
  this is a string.
  this is self: #{to_s}
EOS

puts str
