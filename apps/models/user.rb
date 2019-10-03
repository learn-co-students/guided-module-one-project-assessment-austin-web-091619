class User < ActiveRecord::Base
    has_many :games
    has_many :levels, through: :games

    def attempts
        self.games.order(:user_id)
    end

    def attempts_by_level
        arrLevel = [1,2,3,4,5,6,7,8,9,10]
        att_array = []
        arrLevel.each do |level| 
            att_array << self.games.where(level_id: level)
        end
        att_array
    end

    def completions
        attempts.where("completion_time != nil")
    end

    def completions_by_level
        arrLevel = [1,2,3,4,5,6,7,8,9,10]
        comp_array = []
        arrLevel.each do |level|
           x = self.games.where(level_id: level) 
           comp_array << x.select {|time| time.completion_time != nil}
        end
        comp_array
    end

    def success_rate
        (completions.count / attempts.count) * 100
    end

    def highest_level
        completions.order(:level_id).last
    end

    def fastest_completion_by_level
        arrLevel = [1,2,3,4,5,6,7,8,9,10]
        fc = []
        arrLevel.each do |level| 
            fc << self.games.where(level_id: level).order(:completion_time).first
        end
        fc
    end
end