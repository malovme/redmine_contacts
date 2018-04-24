Redmine::Plugin.register :redmine_contacts do
  name 'Redmine Contacts plugin'
  author 'Michael Malov'
  description 'This is a demo plugin for Redmine to add contacts'
  version '0.0.1'
  url 'https://github.com/malovme/redmine_contacts'
  author_url 'https://github.com/malovme'

  # comment following string if you need at your own risk
  requires_redmine :version => '3.4.5' # should work with other versions but tested with redmine-3.4.5 only

  project_module :redmine_contacts do
    permission :view_contacts, {
      contacts: [:index, :show]
    }
    permission :add_contacts, {
      contacts: [:new, :create]
    }
    permission :edit_contacts, {
        contacts: [:edit, :update]
    }
    permission :destroy_contacts, {
        contacts: [:destroy]
    }
  end

  menu :project_menu,
       :contacts,
       { controller: 'contacts', action: 'index' },
       caption: :contacts_title,
       before: :wiki,
       param: :project_id

end
