Redmine::Plugin.register :redmine_contacts do
  name 'Redmine Contacts plugin'
  author 'Michael Malov'
  description 'This is a plugin for Redmine to add contacts'
  version '0.0.1'
  url 'https://github.com/malovme/redmine_contacts'
  author_url 'https://github.com/malovme'

  # comment following string if you need at your own risk
  requires_redmine :version => '3.4.5' # should work with other versions but tested with redmine-3.4.5 only

end
