class Contact < ActiveRecord::Base
  include Redmine::SafeAttributes

  belongs_to :project

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :project_id, :presence => true

  acts_as_searchable columns: ["#{table_name}.name"], date_column: :created_at, preload: [:project]
  acts_as_event title: :name,
                datetime: :created_at,
                description: Proc.new { |o| "#{l(:label_contact)}: ##{o.id} #{o.name}" },
                url: Proc.new { |o| { :controller => 'contacts',
                                      :action => 'show',
                                      :id => o.id,
                                      :project_id => o.project }
                }

  scope :visible,  lambda { |*args|
    joins(:project).where(Project.allowed_to_condition(args.shift || User.current, :view_contacts, *args))
  }

  #all } # TODO: handle access permissions for contacts

  safe_attributes 'name'

end
