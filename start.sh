# Gem install
bundle check || bundle install
# database setup
bundle exec rails db:setup
# run tests
bundle exec rspec
# Run our server
bundle exec puma -C config/puma.rb