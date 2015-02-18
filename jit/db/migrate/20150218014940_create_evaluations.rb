class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
    	t.integer :user_id
    	t.integer :assignment_id
    	t.integer :description_flag

      t.timestamps
    end
  end
end
