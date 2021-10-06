class Admins::AttributesController < ApplicationController

  def index
    @attribute = Attribute.new
    @attributes = Attribute.all
  end

  def create
    attribute = Attribute.new(attribute_params)
    attribute.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def attribute_params
    params.require(:attribute).permit(:name)
  end

end
