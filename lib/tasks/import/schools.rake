namespace :import do

	desc "Import schools"
	task :schools => :environment do
		puts "Import schools..."	

		SCHOOLS = [
		{ name: "Agnes Scot University", city: "Decatur", state: "Georgia",	website: "www.agnesscott.edu", total_applicants: 1340, percent_admitted: 67, percent_attending: 28, range_sat_cr: "500-600", range_sat_math: "510-650", range_sat_writing: "520-650", range_act_comp: "22-28", average_hs_gpa: 3.59, superscore_sat: true, superscore_act: false },
		{ name: "Albion College", city: "East Porter", state: "Michigan",	website: "www.albion.edu", total_applicants: 4430, percent_admitted: 56, percent_attending: 14, range_sat_cr: "520-580", range_sat_math: "510-590", range_sat_writing: " ", range_act_comp: "22-28", average_hs_gpa: 3.50, superscore_sat: true, superscore_act: true },
		{ name: "Alfred University", city: "Alfred", state: "New York",	website: "www.alfred.edu", total_applicants: 3417, percent_admitted: 70,	percent_attending: 22, range_sat_cr: "490-590", range_sat_math: "510-610", range_sat_writing: "460-570", range_act_comp: "22-27", average_hs_gpa: 3.18, superscore_sat: true, superscore_act: false },
		{ name: "Allegheny College", city: "Meadville", state: "Pennsylvania",	website: "www.allegheny.edu", total_applicants: 4512, percent_admitted: 65,	percent_attending: 21, range_sat_cr: "530-640", range_sat_math: "540-650", range_sat_writing: "520-630", range_act_comp: "23-29", average_hs_gpa: 3.74, superscore_sat: true, superscore_act: false },
		{ name: "American University", city: "Northwest", state: "Washington, D.C.",	website: "www.american.edu", total_applicants: 17545, percent_admitted: 41,	percent_attending: 21, range_sat_cr: "590-690", range_sat_math: "570-660", range_sat_writing: "580-680", range_act_comp: "26-30", average_hs_gpa: 3.74, superscore_sat: true, superscore_act: false }
		]

		School.delete_all

		SCHOOLS.each do |s|
			School.create(s)
		end 
	end 
end 