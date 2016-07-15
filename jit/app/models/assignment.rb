class Assignment < ActiveRecord::Base
	has_many :questions
	def self.current
		Assignment.all.order("writer_due").last || nil
	end

	def current?
		self === Assignment.current
	end		
end
