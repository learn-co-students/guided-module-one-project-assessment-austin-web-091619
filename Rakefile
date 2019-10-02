require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  # ActiveRecord::Base.verbose_query_logs = false
  # ActiveSupport::Logger.silencer = true
  ActiveRecord::Base.logger.level = :fatal 
  Pry.start
end
