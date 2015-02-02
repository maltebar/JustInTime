class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :question_id
      t.boolean :discuss
      t.string :rate 

      t.timestamps
    end
  end
end
