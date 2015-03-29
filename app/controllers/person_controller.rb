class PersonController < ApplicationController
    def create
        @period = Period.find(params[:period_id])
        
        @person = Person.new(person_params)
        @person.period = @period
        @person.entry_time = Time.now()
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
        @person = Person.find(params[:person_id])
        @person.exit_time = Time.now()

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
