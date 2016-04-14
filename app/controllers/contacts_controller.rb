class ContactsController < ApplicationController
 
 def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver && @contact.valid?
      redirect_to :back, :notice => "Thanks! We'll Catch You Later!"
    else
      redirect_to :back, :alert => "Could Not Send!"
    end
  end
end