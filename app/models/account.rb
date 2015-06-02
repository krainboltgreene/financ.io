class Account < ActiveRecord::Base
  devise :database_authenticatable
  devise :registerable
  devise :recoverable
  devise :rememberable
  devise :trackable
  devise :validatable
  devise :confirmable
  devise :lockable
  devise :timeoutable
end
