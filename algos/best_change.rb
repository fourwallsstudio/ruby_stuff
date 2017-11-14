require 'byebug'

# coins = [10, 7, 1]
# amount = 14
def make_change(coins, amount)
  possible_changes = Hash.new { |h,k| h[k] = [] }

  # create a hash of total coins that fit in range(0..amount) for each coin
  # eg:        0  1  2  3  4  ... 11 12 13 14
  #     { 10: [0, 0, 0, 0, 0, ... 1, 1, 1, 1] }
  coins.each { |c| (amount + 1).times { |amt| possible_changes[c] << amt / c } }

  best_change = nil
  current_change = []

  coins.each do |coin|
    current_amt = amount

    coins[coins.index(coin)..-1].each do |next_coin|
      possible_changes[next_coin][current_amt].times do
        current_change << next_coin
        current_amt -= next_coin
      end
    end

    if best_change.nil? ||
      (current_change.length > 0 &&
        current_change.length < best_change.length)

      best_change = current_change
    end

    current_change = []
    current_amt = amount
  end

  best_change
end

puts make_change([10, 7, 1], 14)
