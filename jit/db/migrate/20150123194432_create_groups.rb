class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.boolean	:writer

      t.timestamps
    end
  end
end
