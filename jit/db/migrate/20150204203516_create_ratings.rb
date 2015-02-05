class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.boolean :discuss
    	t.integer :user_id
    	t.integer :question_id

      t.timestamps
    end
  end
end
