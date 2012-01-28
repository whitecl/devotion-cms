# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

resque_config = YAML.load_file(File.join(Rails.root, 'config', 'resque-pw.yml'))

# This shows resque-web at /resque
require 'resque/server'
Resque::Server.use Rack::Auth::Basic do |username, password|
 username == resque_config['username'] && password == resque_config['password']
end
run Rack::URLMap.new \
  "/"       => DevotionCms::Application,
  "/resque" => Resque::Server.new