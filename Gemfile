source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql', '~> 2.8.1'
gem 'therubyracer', '~> 0.9.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Using thin + foreman for web server
gem 'thin', '~> 1.3.1'
gem 'foreman', '~> 0.31.0'

gem 'jquery-rails', '~> 1.0.19'

# For active admin
gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git' # In anticipation of 0.4.0 coming out soon.
gem 'sass-rails',   '~> 3.1.5'
gem "meta_search",  '>= 1.1.0.pre'

# This is for forms and rich text forms
gem 'formtastic', '~> 2.0.2'
gem 'rich', '~> 0.0.8'

# Active admin installs devise anyway, but since we're using it for contributors, let's explicitly set the version.
gem 'devise', '~> 1.5.3'

# Used for queued mail sending
gem 'resque', '~> 1.19.0'
gem 'resque-scheduler', '~> 1.9.9'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
