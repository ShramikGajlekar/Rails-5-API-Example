class User < ApplicationRecord
	acts_as_token_authenticatable
	has_many :addresses
	has_many :pots
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 	#before_validation :capitalize_names_remove_spaces
 	
 	private
 		def capitalize_names_remove_spaces
 			self.first_name.capitalize!
 			self.last_name.capitalize!
 			self.first_name.gsub!(' ','')
 			self.last_name.gsub!(' ','')
 		end
end
