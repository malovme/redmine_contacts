class Contact < ActiveRecord::Base

  belongs_to :project

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :project_id, :presence => true

  scope :visible, -> { all } # TODO: handle access permissions for contacts

end
