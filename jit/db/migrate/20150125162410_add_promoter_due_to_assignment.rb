class AddPromoterDueToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :promoter_due, :datetime
  end
end
