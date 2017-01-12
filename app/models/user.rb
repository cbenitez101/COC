class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#validates :rol, :username, :email, :pass, presence: true
	has_one :profile, :foreign_key => 'user_id', :dependent => :destroy
	has_one :history, :foreign_key => 'user_id', :dependent => :destroy
end
