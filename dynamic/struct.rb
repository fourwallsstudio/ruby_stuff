Tweet = Struct.new(:user, :body) do
  def to_s
    "#{user}: #{body}"
  end
end

tweet = Tweet.new("@me", "first tweet")

puts tweet.to_s
