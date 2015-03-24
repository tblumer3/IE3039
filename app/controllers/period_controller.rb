class PeriodController < ApplicationController
    def start
        @period = Period.new(period_params)
        result = @period.save

        respond_to do |format|
            format.json { 
                if result
                    render json: @period
                else
                    render json: false
                end 
            }
        end
    end

    def entry
        @period = Period.find(params[:period_id])
    end

    def exit
        @period = Period.find(params[:period_id])
    end

    def end
        @period = Period.find(params[:period_id])
        @period.end_time = Time.now()
        @period.save
    end

    private
        def period_params
            params.require(:period).permit("title")
        end
end
