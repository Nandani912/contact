class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = current_user.contacts
  end
  def show
    @contact = Contact.find(params[:id])
  end
  def new
   @contact= Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render 'new'
    end
  end
    def edit
    @contact = Contact.find(params[:id])
    end
    def update
      @contact = Contact.find(params[:id])
        if @contact.update(contact_params)
        redirect_to @contact
        else
          render 'edit'
        end
    end
    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to contacts_path
      end
      
end

private 
  def contact_params
  params.require(:contact).permit(:name, :email, :phone , :user_id)
  end
