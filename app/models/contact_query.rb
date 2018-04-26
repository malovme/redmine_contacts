class ContactQuery < Query

  self.queried_class = Contact
  self.view_permission = :view_contacts

  self.available_columns = [
      QueryColumn.new(:id, :sortable => "#{Contact.table_name}.id", :default_order => 'desc', :caption => '#', :frozen => true),
      #QueryColumn.new(:project, :sortable => "#{Project.table_name}.name", :groupable => true),
      QueryColumn.new(:name, :sortable => "#{Contact.table_name}.name")
  ]

  def initialize(attributes=nil, *args)
    super attributes
    self.filters ||= {}
  end

  #def new_record?
  #  false # TODO: add ability to save queries
  #end

  #def editable_by?(user)
  #  false # TODO: make contact queries editable
  #end

  def initialize_available_filters
    #add_available_filter "id", :type => :integer
    add_available_filter "id", :type => :integer, :label => :label_contact
    add_available_filter "name", :type => :text
    #add_custom_fields_filters(issue_custom_fields)
    #add_associations_custom_fields_filters :project, :author, :assigned_to, :fixed_version
  end

  def available_columns
    return @available_columns if @available_columns
    @available_columns = self.class.available_columns.dup
  end

  def default_columns_names
    @default_columns_names ||= [:name] # TODO: replace hardcoded default columns by values from module settings
  end

  def contacts(options={})
    order_option = [group_by_sort_order, (options[:order] || sort_clause)].flatten.reject(&:blank?)

    scope = Contact.visible.
        joins(:project).
        where(statement).
        includes(([:project] + (options[:include] || [])).uniq).
        where(options[:conditions]).
        order(order_option).
        joins(joins_for_order_statement(order_option.join(','))).
        limit(options[:limit]).
        offset(options[:offset])

    #scope = scope.preload(columns.map(&:name))
    #if has_custom_field_column?
    #  scope = scope.preload(:custom_values)
    #end

    contacts = scope.to_a
    contacts
  rescue ::ActiveRecord::StatementInvalid => e
    raise StatementInvalid.new(e.message)
  end

  def build_from_params(params)
    super
    self
  end
end