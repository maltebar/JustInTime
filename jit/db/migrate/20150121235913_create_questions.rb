class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
