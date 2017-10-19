class Tweet
  attr_accessor :status, :created_at

  def initialize
    yield self if block_given?
  end
end

tweet = Tweet.new do |tweet|
  tweet.status = 'tweet initialized'
  tweet.created_at = Time.now
end

puts tweet.status
puts tweet.created_at
