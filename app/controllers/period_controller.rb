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
        @people = Person.where(period_id: @period.id).order('entry_time DESC')
    end

    def exit
        @period = Period.find(params[:period_id])

        @people = Person.where(period_id: @period.id).order('entry_time DESC')
    end

    def end
        @period = Period.find(params[:period_id])
        @period.time_end = Time.now()
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

    private
        def period_params
            params.require(:period).permit("title")
        end
end
