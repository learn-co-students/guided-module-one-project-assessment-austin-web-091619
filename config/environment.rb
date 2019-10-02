require 'bundler/setup'
require 'pry'
require 'poke-api-v2'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger.level = :fatal 



# Bundler.require

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

# ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: 'db/cta_tracker.db'})