class Pokemon <ActiveRecord::Base
    has_many :userpokemons
    has_many :users, through: :userpokemons

end