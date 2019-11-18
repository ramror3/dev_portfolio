class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	#custome scopes
	def self.passion_money
		where(subtitle: 'Money from your passion') 
	end

	#custome scopes
	scope :portfolio_items, -> { where(subtitle: 'Passion') }

	#set default values
	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://via.placeholder.com/200x200"
		self.thumb_image ||= "https://via.placeholder.com/200x200"
	end

	#or
	# if self.main_image == nil
	# 	self.main_image = "https://via.placeholder.com/200x200"
	# end
	
end
