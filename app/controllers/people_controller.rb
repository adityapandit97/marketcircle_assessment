class PeopleController < ApplicationController
    def index
      @people = Person.all
      @person = Person.new
    end

    def show
      @person = Person.find(params[:id])
    end
  
    def create
      @person = Person.new(person_params)
      if @person.save
        @person.create_detail(detail_params) unless @person.detail.present?
        redirect_to people_url, notice: "Person was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    private

    def person_params
      params.require(:person).permit(:name, detail_attributes: [:id, :title, :email, :age, :phone, :_destroy])
    end

    def detail_params
      params[:person][:details].permit(:title, :age, :phone, :email)
    end
end
