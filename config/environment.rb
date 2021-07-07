require 'bundler/setup'
require 'pry'
require 'sinatra/activerecord'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../apps/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection({adapter: 'sqlite3', database: 'db/connect_game.db'})