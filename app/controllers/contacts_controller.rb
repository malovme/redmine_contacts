class ContactsController < ApplicationController

  before_action :find_optional_project
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
    # @contact
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      redirect_to contacts_path(@project)
    else
      render :new
    end
  end

  def edit
    # @contact
  end

  def update
    if @contact.update_attributes(contact_params)
      flash[:notice] = l(:notice_successful_update)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    if @contact.delete
      redirect_to contacts_path
    else
      #flash[:error] = l(:text_)
      redirect_to contacts_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
