class PersonProfilesController < ApplicationController
  
  def index
    @persons = PersonProfile.all
  end
  
  def show
    @person = PersonProfile.find(params[:id])
  end
  
end
