# Redmine contacts (redmine_contacts)

This is a demo plugin for Redmine to add contacts
https://github.com/malovme/redmine_contacts

## Requirements

* ruby-2.3.4
* MySQL (tested with 5.7)
* redmine-3.4.5

## Testing

For now Minitest is used for tests as being default way for redmine and rails.

```
bundle exec rake redmine:plugins:test NAME=redmine_contacts
```

or

```
bundle exec rake redmine:plugins:test:units NAME=redmine_contacts
```

## Installation

1. Copy plugin sources to <redmine_root>/plugins/redmine_contacts
    ```
    cd plugins/
    git clone git@github.com:malovme/redmine_contacts.git
    ```
2. Run plugin migrations
    ```
    bundle exec rake redmine:plugins:migrate NAME=redmine_contacts RAILS_ENV=production
    ```
3. Restart redmine

## Uninstallation

1. Revert plugin migrations
    ```
    bundle exec rake redmine:plugins:migrate NAME=redmine_contacts VERSION=0 RAILS_ENV=production`
    ```
2. Delete plugin sources  
    ```
    rm -r plugins/redmine_contacts`
    ```
3. Restart redmine

## TODO

* Cover with tests (minitest to follow redmine and rails default, then replace with rspec)
* Test redmine_contacts module permissions
* Add locales for required languages, only "en" exist now
* Add ability to add custom fileds for contact
* Add ability to search for contacts search
___

* Contacts and projects relations. Now project has many contacts and contact belongs to project.
  Add ability to share contacts between projects as well as restrict access to contact from external project.
* Add other(api, csv, atom, pdf ...) formats for contacts rendering.
* add queries from sessions, saved/editable queries,
  remove code duplication in _contact_query_form.html.erb(queries/query_form)
* Add pagination (Paginator) for contacts
* Add "New contact" to project "+" menu
* more TODOs in source code  
  `grep -rn TODO: plugins/redmine_contacts/`

## Questions

* How to add db schema generated by plugin?
* Is it fine according rails style guide to use
    match 'projects/:id/hello', :to => 'example#say_hello', :via => 'get'
  for nested routes under redmine core entities?
* Corect way to patch redmine core entities. Why unloadable is used by some redmine developers. 
Why restart is required in development? Compare with [RedmineExtensions::PatchManager.register_model_patch](https://github.com/easyredmine/redmine_extensions/blob/05c5f75b5e831d99ee1fd9d337a61cc6242bb6a5/lib/redmine_extensions/patch_manager.rb#L119)
* Is it fine to add test dependencies(`rspec-rails`, `factory_girl_rails`) in plugin? How `redmine_extensions` do this?

## Faced the problem using this redmine plugin?

Feel free to [file an issue](https://github.com/malovme/redmine_contacts/issues)