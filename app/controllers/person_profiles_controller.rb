class PersonProfilesController < ApplicationController

  def index
    @persons = PersonProfile.all
  end

  def show
    @person = PersonProfile.find(params[:id])
    @quotes = Quote.where(person_profile_id: @person.id)
  end

end
