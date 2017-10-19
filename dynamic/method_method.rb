class Timeline
  def initialize(tweets)
    @tweets = tweets
  end

  def show_tweet(index)
    puts "tweet_#{index+1}: \"#{@tweets[index]}\""
  end
end


tweets = ["cool", "wow", "nice"]

timeline = Timeline.new tweets

print_tweets = timeline.method(:show_tweet)

(0..tweets.length-1).each(&print_tweets)
