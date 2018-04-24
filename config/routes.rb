# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

scope "projects/:project_id" do
  resources 'contacts'
end
