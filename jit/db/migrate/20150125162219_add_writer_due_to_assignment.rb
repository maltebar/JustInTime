class AddWriterDueToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :writer_due, :datetime
  end
end
