class Session < ActiveRecord::Base
    before_save :start_time

    private
        def start_time
            self.time_start = DateTime.now
        end
end
