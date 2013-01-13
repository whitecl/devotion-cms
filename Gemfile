source 'http://rubygems.org'

gem 'rails', '3.2.11'

gem 'mysql2', '~> 0.3.11'
gem 'therubyracer', '~> 0.9.10'

gem 'sass-rails', '~> 3.2.5'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.3.0'
end

# Using thin + foreman for web server
gem 'thin', '~> 1.3.1'
gem 'foreman', '~> 0.31.0'

gem 'jquery-rails', '~> 1.0.19'

# For active admin
gem 'activeadmin', '~> 0.5.1'

# This is for forms and rich text forms
gem 'formtastic', '~> 2.2.1'
gem 'rich', '~> 1.4.1'

# Active admin installs devise anyway, but since we're using it for contributors, let's explicitly set the version.
gem 'devise', '~> 1.5.3'

# Used for queued mail sending
gem 'resque', '~> 1.19.0'
gem 'resque-scheduler', '~> 1.9.9'

# For videos
gem 'ruby-oembed', '~> 0.8.8'

# Attaching files - rich already install paperclip, but lets get an explicit version.
gem 'paperclip', '~> 2.7.4'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
