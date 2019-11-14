# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.0"

gem "activerecord-session_store"
gem "aws-sdk-s3", require: false
gem "bootsnap", ">= 1.4.2", require: false
gem "bugsnag"
gem "chartkick"
gem "devise"
gem "groupdate"
gem "jbuilder", "~> 2.7"
gem "omniauth-google-oauth2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "semantic-ui-sass"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
