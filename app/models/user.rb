class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable

  # We don't want to create new users, so the :registerable
  # property is commented out; new users will be created
  # programatically (as of now there's only need for one
  # admin user)
  # Also, no password recovering.
  devise :database_authenticatable, #:registerable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
