require 'concurrent'

class Hello
  include Concurrent::Async

  def hello(name)
    raise 'error' if name == 5
    puts "Hello, #{name}!"
  end
end

h = Hello.new

100.times do |i|
  ivar = h.async.hello i
  puts ivar.state
end

puts "can i butt in??"

