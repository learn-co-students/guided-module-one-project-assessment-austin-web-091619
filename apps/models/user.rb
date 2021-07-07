class User < ActiveRecord::Base
    has_many :stats
    has_many :levels, through: :stats
end