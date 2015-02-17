class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.boolean :active 
      t.boolean :reveal_1
      t.boolean :reveal_2
      t.boolean :reveal_3
      t.float :percent_1
      t.float :percent_2
      t.float :percent_3

      t.timestamps
    end
  end
end
