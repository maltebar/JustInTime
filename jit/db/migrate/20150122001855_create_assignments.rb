class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.boolean :active 

      t.timestamps
    end
  end
end
