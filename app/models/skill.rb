class Skill < ApplicationRecord
	validates_presence_of :title, :percent_utilized

	#set default values
	after_initialize :set_defaults

	# def set_defaults
	# 	self.badge ||= "https://via.placeholder.com/150x150"
	# end

	#we can call the concern here
	def set_defaults
		self.badge ||= Placeholder.image_generator(height: '150', width: '150')
	end
end
