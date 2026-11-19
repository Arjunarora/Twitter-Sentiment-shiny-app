# Twitter Sentiment Analysis (R + Shiny)

> 📦 **Archived student project (2016).** One of my first data projects. Kept for reference; it is not maintained.
> The Twitter API v1.1 and the `twitteR` package it relies on no longer work, so tweet collection will not run today.

Collects tweets for a keyword, scores each tweet with a lexicon-based sentiment score (−5 to +5), and classifies sentiment with CART and random-forest models. A Shiny app wraps the workflow in a simple UI with plots and a time-period filter.

## Structure

```
├── ui.r, server.r            # Shiny app (run from the repo root)
├── analysis/                 # standalone analysis scripts
│   ├── tweet-collecting.r    # collect tweets → data/collected_tweets.csv
│   ├── tweets-cleaning.r     # text cleaning
│   ├── sentiment-dictionary.r, sentiment-algo.r   # lexicon scoring
│   ├── tweets-sparse.r, cart-model.r, main.r     # document-term matrix + models
│   └── tweet-wordcloud.r
├── positive-words.txt        # opinion lexicon (Hu & Liu)
└── negative-words.txt
```

## Running

Credentials are read from environment variables (never hard-coded):

```r
Sys.setenv(TWITTER_API_KEY = "...", TWITTER_API_SECRET = "...",
           TWITTER_ACCESS_TOKEN = "...", TWITTER_ACCESS_TOKEN_SECRET = "...")
shiny::runApp(".")
```

## Tech
R · Shiny · twitteR · tm · rpart · randomForest · ggplot2 · wordcloud

## Credits
Opinion lexicon: Minqing Hu and Bing Liu, "Mining and Summarizing Customer Reviews", KDD 2004.
