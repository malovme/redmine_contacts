class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.integer :project_id, null: false
      t.timestamps null: false
    end
  end
end
