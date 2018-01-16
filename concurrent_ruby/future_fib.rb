require 'concurrent'

class CountingObserver

  def initialize(count, &block)
    @count = count
    @block = block
  end

  def update(time, value, reason)
    @count -= 1

    if @count <= 0
      @block.call()
    end
  end
end

def dataflow(*inputs, &block)
  result = Concurrent::Future.new do
    values = inputs.map { |input| input.value }
    block.call(*values)
  end

  if inputs.empty?
    result.execute
  else
    barrier = CountingObserver.new(inputs.size) { result.execute }

    inputs.each do |input|
      input.add_observer barrier
    end
  end

  result
end

def fib(n)
  if n < 2
    Concurrent::dataflow { n }
  else
    n1 = fib(n - 1)
    n2 = fib(n - 2)
    Concurrent::dataflow(n1, n2) { |v1, v2| v1 + v2 }
  end
end

f = fib(14)
sleep(0.5)

puts f.value
