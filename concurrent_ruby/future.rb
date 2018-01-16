require 'concurrent'
require 'thread'
require 'open-uri'

class Ticker
  def get_year_end_closing(symbol, year)
    uri = "http://ichart.finance.yahoo.com/table.csv?s=#{symbol}&a=11&b=01&c=#{year}&d=11&e=31&f=#{year}&g=m"
    data = open(uri) { |f| f.collect { |line| line.strip } }
    data[1].split(',')[4].to_f
  end
end

price = Concurrent::Future.execute { Ticker.new.get_year_end_closing('TWTR', 2013) }
puts price.state
puts price.pending?
puts price.value(0)

sleep(1)

puts price.value
puts price.state
puts price.fulfilled?
puts price.value

