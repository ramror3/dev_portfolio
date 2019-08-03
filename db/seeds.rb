# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |blog|
	Blog.create!(
		title: "My Blog Post #{blog}",
		body: "It has changed the way I look at myself and the world. I am beginning to feel the oneness of all the joy of existence. Many of the negative emotions are fading with the realization that it is all coming from me, not from external situations"
	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 15
	)
end

puts "5 skills created"

9.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "Inner Engineering",
		body: "So much depth and insight was offered to look at my own mind and see how the same thought process and emotions that were capable of causing me misery can be a miraculous instrument to create my life joyously.",
		main_image: "https://via.placeholder.com/300x300",
		thumb_image: "https://via.placeholder.com/300x300"
	)
end