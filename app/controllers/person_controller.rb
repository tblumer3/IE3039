class PersonController < ApplicationController
    def create
        @person = Person.new(params[:person])
        @person.session = params[:session_id]
        success = @person.save

        respond_to do |format|
            format.json { 
                if (success) {
                    render json:  {'status' => 'success'}
                } else {
                    render json:  {'status' => 'failure'}
                }
            }
        end
    end

    def all
    end

    def end
    end

    private
        def person_params
            params.require(:person).permit(:description, :age, :gender)
        end
end
