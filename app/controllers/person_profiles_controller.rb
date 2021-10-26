class PersonProfilesController < ApplicationController

  def index
    @persons = PersonProfile.all.page(params[:page]).per(12)
  end

  def show
    @person = PersonProfile.find(params[:id])
    @quotes = Quote.where(person_profile_id: @person.id).all.page(params[:page]).per(12)
  end

end
