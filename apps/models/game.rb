class Game < ActiveRecord::Base
    belongs_to :users
    belongs_to :levels

    def global_fastest
        Game.where("completion_time > 0").order(:completion_time).first(3)
    end

    def global_attempts
        Game.all.select {|attempt| attempt.user_id}
    end

    def global_completions
        Game.all.select {|game| game.completion_time != nil}
    end

    def global_success_rate
        x = Game.all.select {|attempt| attempt.user_id}.count
        y = Game.all.select {|game| game.completion_time != nil}.count
        (y.to_f / x.to_f) * 100
    end


end
