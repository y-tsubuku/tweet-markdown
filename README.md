# README

## Ruby version
`2.3.1`

## System dependencies

## bundle install

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
