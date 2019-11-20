class Portfolio < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, 
																reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	#custome scopes
	def self.passion_money
		where(subtitle: 'Money from your passion') 
	end

	#custome scopes
	scope :portfolio_items, -> { where(subtitle: 'Passion') }

	#set default values
	after_initialize :set_defaults

	# def set_defaults
	# 	self.main_image ||= "https://via.placeholder.com/200x200"
	# 	self.thumb_image ||= "https://via.placeholder.com/200x200"
	# end

	#or
	# if self.main_image == nil
	# 	self.main_image = "https://via.placeholder.com/200x200"
	# end
	
	#we can call the concern here
	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '200', width: '200')
		self.thumb_image ||= Placeholder.image_generator(height: '300', width: '300')
	end
end
