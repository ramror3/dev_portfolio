class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	#custome scopes
	def self.passion_money
		where(subtitle: 'Money from your passion') 
	end

	#custome scopes
	scope :portfolio_items, -> { where(subtitle: 'Passion') }
end
