class Keyword < ActiveRecord::Base
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
     config.consumer_key        = "3YO3Jm1Zt3qjHNUWAuetu9E2c"
     config.consumer_secret     = "wck9VN4NhaujZMEUbPWsL2Yb5QnlsGl0PrAXfwcenIE8acwXs7"
     config.access_token        = "597532306-APsZQIfvEvhVB3WS1YF6rTq6qZQbh4W3m1HF1UNO"
     config.access_token_secret = "F8Zt062UdUCKjDKQKtbUF2BIBVtQZxKyuccXqf5HVoZrl"
    end

    client.search(self.word, result_type: "recent").take(3).collect do |tweet|
     "#{tweet.user.screen_name}: #{tweet.text}"
    end

  end
 end
