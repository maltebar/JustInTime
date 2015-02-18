class AddEvaluationsQuestionsTable < ActiveRecord::Migration
  def change
    create_table :evaluations_questions, id: false do |t|
      t.belongs_to :evaluation, index: true
      t.belongs_to :question, index: true
    end  	
  end
end
