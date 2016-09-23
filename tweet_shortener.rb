# Write your code here.
$dictionary = {
  "hello"=>"hi",
  "to"=>"2",
  "two"=>"2",
  "too"=>"2",
  "for"=>"4",
  "four"=>"4",
  "be"=>"b",
  "you"=>"u",
  "at"=>"@",
  "and"=>"&"
}

def word_substituter(tweet)
  tweet = tweet.split(' ')
  tweet = tweet.collect do |x|
    if $dictionary.keys.include?(x) || $dictionary.keys.include?(x.downcase)
      x = $dictionary[x.downcase]
    end
    x
  end
  tweet.join(' ')
end

def bulk_tweet_shortener(tweets)
  tweets.each do |x|
    puts word_substituter(x)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length < 140
    tweet
  else
    tweet = word_substituter(tweet)
    if tweet.length < 140
      tweet
    else
      tweet = tweet.slice(0, 137)
      tweet = tweet+"..."
      tweet
    end
  end
end
