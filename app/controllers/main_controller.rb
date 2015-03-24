class MainController < ApplicationController
    def index
        @session = Session.new
    end
end
