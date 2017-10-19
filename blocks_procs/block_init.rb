class Tweet
  attr_accessor :status, :created_at

  def initialize
    yield self if block_given?
  end

  def tweet_as(user)
    lambda do |tweet|
      lambda do |follower|
        puts "#{user}: #{tweet} | liked by: #{follower}"
      end
    end
  end
end

tweet = Tweet.new do |tweet|
  tweet.status = 'tweet initialized'
  tweet.created_at = Time.now
end

puts tweet.status
puts tweet.created_at

my_tweet = tweet.tweet_as("@me")
show_follower = my_tweet.call("check it out")
show_follower.call("@some_guy")
