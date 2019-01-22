class User < ApplicationRecord
	acts_as_token_authenticatable
	has_many :addresses
	has_many :posts
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 	before_validation :capitalize_names_remove_spaces
 	
 	private
 		def capitalize_names_remove_spaces
 			self.first_name.capitalize! if self.first_name
 			self.last_name.capitalize! if self.last_name
 			self.first_name.gsub!(' ','') if self.first_name
 			self.last_name.gsub!(' ','') if self.last_name
 		end
end
