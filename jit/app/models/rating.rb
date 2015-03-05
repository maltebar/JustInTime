class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	validates :discuss, presence: true
end
