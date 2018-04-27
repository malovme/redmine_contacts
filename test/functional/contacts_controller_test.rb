require File.expand_path('../../test_helper', __FILE__)

class ContactsControllerTest < ActionController::TestCase

  fixtures :projects, :roles, :users, :contacts

  def setup
    User.current = User.find(1)
    @request.session[:user_id] = 1
    @project = Project.find(1)
    @project.enable_module! :redmine_contacts
    Role.find(1).add_permission! :view_contacts
  end

  test "should get index" do
    get :index, project_id: @project.id
    assert_response :success
  end

  test "should get new" do
    get :new, project_id: @project.id
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, project_id: @project.id, contact: { name: contacts(:john).name }
    end
    contact = assigns(:contact)
    assert_redirected_to project_contacts_path(contact.project)
    assert_match /#{contact.name}/, flash[:notice]
  end

  test "should show contact" do
    get :show, id: contacts(:john).id
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: contacts(:john).id, contact: { name: 'John updated' }
    contact = assigns(:contact)
    assert_equal 'John updated', contact.name
    assert_redirected_to project_contacts_path(contact.project)
  end

  test "should destroy contact" do
    contact = contacts(:john)
    assert_difference('Contact.count', -1) do
      delete :destroy, id: contact.id
    end
    assert_redirected_to project_contacts_path(contact.project)
  end

end
