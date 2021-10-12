source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'pry-byebug'
  gem 'rspec-rails' # Rspecテスト
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

end
group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
  # Deviseの日本語化
gem 'devise-i18n'
gem 'devise-i18n-views'
  # ページネーション 
gem 'kaminari', '~> 1.1.1'
# ファイルのアップロード先を柔軟に設定できる
# 簡単に組み込める
# 画像のサムネイルを生成できる
gem 'refile', require: "refile/rails", github: 'manfe/refile'
# アップロードした画像のリサイズを簡単に実装
gem "refile-mini_magick"
# Sass：「Syntactically Awesome Style Sheets」の略。Ruby ベース
gem 'bootstrap-sass','~>3.3.6'
# jqueryを扱えるようになる
gem 'jquery-rails'
# 簡単にフォームを追加したり、削除したりして中間テーブルに保存するように処理を作ることができる
gem 'cocoon'
# 削除しても残しておける論理削除を実装
gem 'paranoia'
# デフォルトの言語を日本語に設定
gem 'rails-i18n'
# 検索機能
gem 'ransack'
# データの並び替え機能
gem 'acts_as_list'
# クレジット機能（今回は未使用）
gem 'payjp'
# kaminariを使用したページネーションにBootstrapデザインを適用
gem 'kaminari-bootstrap', '~> 3.0.1'