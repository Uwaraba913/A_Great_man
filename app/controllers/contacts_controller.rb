class ContactsController < ApplicationController
  before_action :authenticate_end_user!
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.end_user_id = current_end_user.id
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to contacts_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :content)
  end

end
