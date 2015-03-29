class MainController < ApplicationController
    def index
        @period = Period.new
        @periods = Period.all.order('time_start DESC')
    end
end
