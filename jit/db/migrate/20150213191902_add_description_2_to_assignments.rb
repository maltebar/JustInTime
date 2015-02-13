class AddDescription2ToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :description_2, :text
  end
end
