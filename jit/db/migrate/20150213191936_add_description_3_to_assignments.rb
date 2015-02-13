class AddDescription3ToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :description_3, :text
  end
end
