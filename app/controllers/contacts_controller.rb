class ContactsController < ApplicationController

  helper :queries
  include QueriesHelper

  include ContactQueriesHelper

  before_action :find_optional_project, only: [:index, :new, :create]
  before_action :find_contact_and_project, only: [:show, :edit, :update, :destroy]

  def index
    retrieve_contact_query
    if @query.valid?
      @contacts = @query.contacts
    end
  end

  def show
    # @contact
  end

  def new
    @contact = Contact.new
    @contact.project = @project
  end

  def create
    @contact = Contact.new contact_params
    @contact.project = @project
    if @contact.save
      flash[:notice] = l(:notice_contact_successful_create,
                         name: view_context.link_to("#{@contact.name}", contact_path(@contact), title: @contact.name))
      redirect_after_create
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
      redirect_to project_contacts_path(@project)
    else
      render :edit
    end
  end

  def destroy
    if @contact.delete
      redirect_to project_contacts_path(@project)
    else
      #flash[:error] = l(:text_)
      redirect_to project_contacts_path(@project)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name)
  end

  def find_contact_and_project
    @contact = Contact.find(params[:id])
    @project = @contact.project
  end

  def redirect_after_create
    if params[:continue]
      redirect_to new_project_contact_path(@project)
    else
      redirect_to project_contacts_path(@project)
    end
  end
end
