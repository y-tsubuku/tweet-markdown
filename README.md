# Tweet Markdown

![APP_LOGO](https://raw.githubusercontent.com/y-tsubuku/tweet-markdown/feature/images/images/logo.png)

tweet markdown is a web app that let you tweet markdown as image.

## App
![APP](https://raw.githubusercontent.com/y-tsubuku/tweet-markdown/feature/images/images/app.png)

## Tweet Example
![EXAMPLE](https://raw.githubusercontent.com/y-tsubuku/tweet-markdown/feature/images/images/tweet_ex2.png)

## Ruby version
`2.3.1`

## Install Dependencies

```
bundle install --path vendor/bundle --without production
```

##  Migrate Database
```
bundle exec rails db:migrate
```

## Set Environment Variable
```
bundle exec rails secret
```

### development and test

paste secret key to your env of
`.env` file

### production
paste secret key to `"SECRET_KEY_BASE"`
 
## Twitter API KEY
create twitter app from [Twitter Application Management](https://apps.twitter.com/)

### development and test
paste each API Key and API Secret to your env of
`.env` file

### production

paste each API Key and API Secret to `TWITTER_API_KEY` and `TWITTER_API_KEY_SECRET`

## How to run
```
bundle exec rails s
```
