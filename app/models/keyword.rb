class Keyword < ActiveRecord::Base
  has_many :tweets

  def grab_twitts
    client = Twitter::REST::Client.new do |config|
     config.consumer_key        = "3YO3Jm1Zt3qjHNUWAuetu9E2c"
     config.consumer_secret     = "wck9VN4NhaujZMEUbPWsL2Yb5QnlsGl0PrAXfwcenIE8acwXs7"
     config.access_token        = "597532306-APsZQIfvEvhVB3WS1YF6rTq6qZQbh4W3m1HF1UNO"
     config.access_token_secret = "F8Zt062UdUCKjDKQKtbUF2BIBVtQZxKyuccXqf5HVoZrl"
    end

    client.search(self.word,  result_type: "recent").take(10).collect do |tweet|
      new_tweet = Tweet.new
      new_tweet.tweet_id=tweet.id.to_s
      new_tweet.tweet_created_at=tweet.created_at
      new_tweet.text = tweet.text
      new_tweet.user_uid= tweet.user.id
      new_tweet.user_name=tweet.user.name
      new_tweet.user_screen_name=tweet.user.screen_name
      new_tweet.user_image_url=tweet.user.profile_image_url

      new_tweet.keyword=self

      new_tweet.save

     "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
 end
