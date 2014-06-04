class ContactsController < ApplicationController
  def bug
     @contact = Contact.new
  end
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
      render :new
    else
      flash.now[:error] = 'Cannot send message. Please Enter a Valid Email Address.'
      render :bug
    end
  end
end