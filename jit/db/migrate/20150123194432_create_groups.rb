class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.boolean	:writer
    	t.string	:name

      t.timestamps
    end
  end
end
