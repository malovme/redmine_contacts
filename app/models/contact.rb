class Contact < ActiveRecord::Base
  unloadable

  belongs_to :project

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :project_id, :presence => true
end
