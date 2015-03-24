class SessionController < ApplicationController
    def start
        @session = Session.new(session_params)
        result = @session.save

        respond_to do |format|
            format.json { 
                if result
                    render json: @session
                else
                    render json: false
                end 
            }
        end
    end

    def entry
        @session = Session.find(params[:session_id])
    end

    def exit
        @session = Session.find(params[:session_id])
    end

    def end
        @session = Session.find(params[:session_id])
        @session.end_time = Time.now()
        @session.save
    end

    private
        def session_params
            params.require(:session).permit("title")
        end
end
