module Memoizer

  def memoize(name)
    @@cache ||= Hash.new { |h,k| h[k] = {} }

    f = instance_method(name)

    define_method(name) do |args|
      return @@cache[name][args] if @@cache[name].include?(args)
      @@cache[name][args] = f.bind(self).call(args)
    end
  end
end


class Calculate
  extend Memoizer

  memoize def fib(num)
    return num if num == 0 || num == 1
    fib(num - 1) + fib(num - 2)
  end
end

c = Calculate.new
puts c.fib(5)
