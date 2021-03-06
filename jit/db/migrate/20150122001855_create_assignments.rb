class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.boolean :active 
      t.boolean :reveal_1
      t.boolean :reveal_2
      t.boolean :reveal_3
      t.integer :percent_1, :default => 0
      t.integer :percent_2, :default => 0
      t.integer :percent_3, :default => 0

      t.timestamps
    end
  end
end
