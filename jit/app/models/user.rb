class User < ActiveRecord::Base

	has_one :membership
	has_one :group, :through => :membership
	has_many :questions
	has_many :ratings
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@brandeis.edu/i, on: :create }
  validates_confirmation_of :password

  after_create :assign_group

  def assign_group
     if !self.admin?
        membership = Membership.order("created_at").last
        if membership.nil? || membership.group_id == 2
          group_id = 1
        else
          group_id = 2
        end
        Membership.create(user_id: self.id, group_id: group_id)
    end
  end
end
