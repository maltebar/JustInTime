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
        self.create_membership(group_id: group_id).save()
    end
  end


  def switch_group
    current_group = self.group

    if current_group.id == 1
      self.group = Group.find(2)
    else
      self.group = Group.find(1)
    end

    self.save
  end



end
