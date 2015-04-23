class User < ActiveRecord::Base

	has_one :membership
	has_one :group, :through => :membership
	has_many :questions
	has_many :ratings
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:shibboleth]

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@brandeis.edu/i, on: :create }
  validates_confirmation_of :password
end
