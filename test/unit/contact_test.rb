require File.expand_path('../../test_helper', __FILE__)

class ContactTest < ActiveSupport::TestCase

  test "should not save contact without name and project" do
    contact = Contact.new
    assert_not contact.save
  end

  test "should not save contact without name" do
    contact = Contact.new(project_id: 1)
    assert_not contact.save
  end

  test "should not save contact with too short name" do
    contact = Contact.new(project_id: 1, name: 'Ab')
    assert_not contact.save
  end

  test "should not save contact with too long name" do
    contact = Contact.new(project_id: 1, name: ('A' * 256) )
    assert_not contact.save
  end

  test "should not save contact without project" do
    contact = Contact.new(name: 'John')
    assert_not contact.save
  end

  test "contact should have visible scope" do
    assert_respond_to Contact,:visible
  end

end
