namespace :import do

	desc "Import lists"
	task :lists => :environment do
		puts "Import lists..."	

		LISTS = [
		{ name: "Safety Schools" },
		{ name: "Target Schools" },
		{ name: "Reach Schools" }
		]

		List.delete_all

		LISTS.each do |l|
			List.create(l)
		end 
	end 
end 