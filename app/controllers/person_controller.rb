class PersonController < ApplicationController
    def create
        @period = Period.find(params[:period_id])
        
        @person = Person.new(person_params)
        @person.period = @period
        @person.entry_time = Time.now()
        success = @person.save

        @people = Person.where(period_id: @period.id).order('entry_time DESC')
        @count = @people.length

        respond_to do |format|
            format.json { 
                if success 
                    render json:  {'status' => @person, 'count' => @count }
                else 
                    render json:  {'status' => 'failure'}
                end
            }
        end
    end

    def all
    end

    def end
        @person = Person.find(params[:person_id])
        if params['balk'] == "true"
            past_time = Time.now - 60*60*24
            @person.entry_time = past_time
            @person.exit_time = past_time
        else
            @person.exit_time = Time.now()
        end
        success = @person.save

        redirect_to :controller => 'period', :action => 'exit', :period_id => params[:period_id]


        # respond_to do |format|
        #     format.json { 
        #         if success 
        #             render json:  {'status' => @person}
        #         else 
        #             render json:  {'status' => 'failure'}
        #         end
        #     }
        # end
    end

    private
        def person_params
            params.permit(:description, :isFemale, :id)
        end
end
