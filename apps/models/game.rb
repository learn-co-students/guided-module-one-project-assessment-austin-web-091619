class Game < ActiveRecord::Base
    has_many :stats
    has_many :users, through: :stats
end
