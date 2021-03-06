class Address < ApplicationRecord
  belongs_to :user
  validates :pin, presence: true, length: {is: 6}
  validates :country, presence: true
  validate :validate_country_content

  def validate_country_content
  	country_arr = ['India', 'US', 'UK', 'Nepal', 'Bhutan', 'Bangladesh']
  	unless country_arr.include? country
  		errors.add(:country, "countries allowed as input are #{country_arr}")
  	end
  end

end
