module ContactQueriesHelper

  def retrieve_contact_query
    @query = ContactQuery.new(name: '_', project: @project)
    @query.build_from_params(params)
  end

end
