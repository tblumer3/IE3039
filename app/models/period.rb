class Period < ActiveRecord::Base
    has_many :persons

    before_save :start_time

    private
        def start_time
            if !self.time_start
                self.time_start = DateTime.now
            end
        end
end
