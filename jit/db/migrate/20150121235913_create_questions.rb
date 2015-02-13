class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :user_id
      t.string :user_name
      t.integer :assignment_id
      t.float :percentage
      t.integer :description_flag

      t.timestamps
    end
  end
end
