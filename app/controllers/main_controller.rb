class MainController < ApplicationController
    def index
        @period = Period.new
    end
end
