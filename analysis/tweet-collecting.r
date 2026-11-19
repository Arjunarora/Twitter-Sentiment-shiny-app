dir.create("data", showWarnings = FALSE)
api_key <- Sys.getenv("TWITTER_API_KEY")
api_secret <- Sys.getenv("TWITTER_API_SECRET")
access_token <- Sys.getenv("TWITTER_ACCESS_TOKEN")
access_token_secret <- Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)


N <- 2000
tweets.list <- searchTwitter("Modi", n=N, resultType = "recent",lang = "en")
tweets.df <- ldply(tweets.list, function(t) t$toDataFrame())

write.csv(tweets.df, file="data/collected_tweets.csv")
