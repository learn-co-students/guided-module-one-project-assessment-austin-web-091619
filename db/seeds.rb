alec = User.create(:name=>"Alec", :password=>"noob")
bob = User.create(:name=>"Bob", :password=>"hello")

uno = Level.create(:name=>"Level One")
dos = Level.create(:name=>"Level Two")
tres = Level.create(:name=>"Level Three")

round_one = Game.create(:completion_time=>25, :user_id=>1, :level_id=>1)
round_two = Game.create(:completion_time=>35, :user_id=>1, :level_id=>1)
round_three = Game.create(:completion_time=>55, :user_id=>1, :level_id=>2)
round_four = Game.create(:completion_time=>30, :user_id=>1, :level_id=>3)
round_five = Game.create(:completion_time=>40, :user_id=>1, :level_id=>2)
round_six = Game.create(:completion_time=>20, :user_id=>1, :level_id=>3)