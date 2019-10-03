class User < ActiveRecord::Base
    has_many :games
    has_many :levels, through: :games






end