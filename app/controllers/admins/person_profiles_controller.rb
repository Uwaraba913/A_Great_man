class Admins::PersonProfilesController < ApplicationController
  
  def new
    @person = PersonProfile.new
  end

  def create
    person = PersonProfile.new(person_params)
    person.save
    redirect_to admins_person_profiles_path
  end

  def index
    @persons = PersonProfile.all.page(params[:page]).per(12)
  end

  def show
    @person = PersonProfile.find(params[:id])
    @quotes = @person.quotes.all.order(created_at: "DESC").all.page(params[:page]).per(12)
  end

  def edit
    @person = PersonProfile.find(params[:id])
  end

  def update
    person = PersonProfile.find(params[:id])
    person.update(person_params)
    redirect_to admins_person_profile_path(person.id)
  end

  def destroy
    person = PersonProfile.find(params[:id])
    person.destroy
    redirect_to admins_person_profiles_path
  end

  private

  def person_params
    params.require(:person_profile).permit(:name, :image)
  end
end
