require File.expand_path('../../test_helper', __FILE__)

class ContactsControllerTest < ActionController::TestCase

  fixtures :projects, :roles, :users

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

  #test "should create article" do
  #  assert_difference('Article.count') do
  #    post :create, article: {title: 'Some title'}
  #  end

  #  assert_redirected_to article_path(assigns(:article))
  #  assert_equal 'Article was successfully created.', flash[:notice]
  #end

end
