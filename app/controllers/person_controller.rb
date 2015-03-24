class PersonController < ApplicationController
    def create
        @period = Period.find(params[:period_id])
        
        @person = Person.new(person_params)
        @person.period = @period
        success = @person.save

        respond_to do |format|
            format.json { 
                if success 
                    render json:  {'status' => @person}
                else 
                    render json:  {'status' => 'failure'}
                end
            }
        end
    end

    def all
    end

    def end
    end

    private
        def person_params
            params.permit(:description, :isFemale)
        end
end
