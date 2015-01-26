class User < ActiveRecord::Base

	has_one :membership
	has_one :group, :through => :membership
	has_many :questions
	has_many :evaluations #I think we need this for the promoters but I'm not sure?
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
