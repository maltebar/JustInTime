class RemoveDraftDueFromAssignment < ActiveRecord::Migration
  def change
    remove_column :assignments, :draft_due, :datetime
  end
end
