class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_path
    else
      # raise
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :phone, :email, :content)
  end

end
