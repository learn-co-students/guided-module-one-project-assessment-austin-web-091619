User.delete_all
Pokemon.delete_all
UserPokemon.delete_all

5.times do 
    User.create(name: Faker::Name.name)
end
10.times do
    Pokemon.create(name: Faker::Games::Pokemon.name, weight: Faker::Number.between(from: 1,to: 50))
end
10.times do
    UserPokemon.create(user_id: User.all.sample.id, pokemon_id: Pokemon.all.sample.id)
end