class Evaluation < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :questions

	after_save :assign

	private

	def assign
      @assignment = Assignment.find(Assignment.where(active: true))
      @questions = Question.where(assignment_id: @assignment.id, description_flag: self.description_flag)
      if self.description_flag == 1
        percent = @assignment.percent_1
      elsif self.description_flag == 2
        percent = @assignment.percent_2
      elsif self.description_flag == 3
        percent = @assignment.percent_3
      end
      self.questions << @questions.sample(@questions.count * percent / 100)
      true
    end
end
