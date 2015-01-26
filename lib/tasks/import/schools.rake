namespace :import do

	desc "Import schools"
	task :schools => :environment do
		puts "Import schools..."	

		SCHOOLS = [
		{ name: "Agnes Scot University", 
		  city: "Decatur", 
		  state: "Georgia",	
		  website: "www.agnesscott.edu", 
		  total_applicants: 1340, 
		  percent_admitted: 67, 
		  percent_attending: 28, 
		  range_sat_cr: "500-600", 
		  range_sat_math: "510-650", 
		  range_sat_writing: "520-650", 
		  range_act_comp: "22-28", 
		  average_hs_gpa: "3.59", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.collegeclasses.com/news/wp-content/uploads/2013/11/Agnes-Scott-College-Main-Hall.jpg" },

		{ name: "Albion College", 
		  city: "East Porter", 
		  state: "Michigan",	
		  website: "www.albion.edu", 
		  total_applicants: 4430, 
		  percent_admitted: 56, 
		  percent_attending: 14,
		  range_sat_cr: "520-580", 
		  range_sat_math: "510-590", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "22-28", 
		  average_hs_gpa: "3.50", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://odk.org/wp-content/uploads/2014/05/Albion-College.jpg" },

		{ name: "Alfred University", 
		  city: "Alfred", 
		  state: "New York",	
		  website: "www.alfred.edu", 
		  total_applicants: 3417, 
		  percent_admitted: 70,	
		  percent_attending: 22, 
		  range_sat_cr: "490-590", 
		  range_sat_math: "510-610", 
		  range_sat_writing: "460-570", 
		  range_act_comp: "22-27", 
		  average_hs_gpa: "3.18", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/f/ff/Alfred_University_Powell_Campus_Center.jpg" },

		{ name: "Allegheny College", 
		  city: "Meadville", 
		  state: "Pennsylvania",	
		  website: "www.allegheny.edu", 
		  total_applicants: 4512, 
		  percent_admitted: 65,	
		  percent_attending: 21, 
		  range_sat_cr: "530-640", 
		  range_sat_math: "540-650", 
		  range_sat_writing: "520-630", 
		  range_act_comp: "23-29", 
		  average_hs_gpa: "3.74", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://sitesmedia.s3.amazonaws.com/gatorblogs/files/2011/04/IMG_09531.jpg" },

		{ name: "American University", 
		  city: "Northwest", 
		  state: "Washington, D.C.",	
		  website: "www.american.edu", 
		  total_applicants: 17545, 
		  percent_admitted: 41,	
		  percent_attending: 21, 
		  range_sat_cr: "590-690", 
		  range_sat_math: "570-660", 
		  range_sat_writing: "580-680", 
		  range_act_comp: "26-30", 
		  average_hs_gpa: "3.74", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://cdn.firstwefeast.com/assets/2014/03/128664-050-109142C5.jpg" }, 

		{ name: "Amherst College", 
		  city: "Amherst", 
		  state: "Massachusetts",	
		  website: "www.amherst.edu", 
		  total_applicants: 7927, 
		  percent_admitted: 14,	
		  percent_attending: 41, 
		  range_sat_cr: "670-760", 
		  range_sat_math: "680-770", 
		  range_sat_writing: "670-760", 
		  range_act_comp: "30-34", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/e/e4/Amherst_College_Main_Quad.jpg" },

		{ name: "Angelo State University", 
		  city: "San Angelo", 
		  state: "Texas",	
		  website: "www.angelo.edu", 
		  total_applicants: 2599, 
		  percent_admitted: 80,	
		  percent_attending: 58, 
		  range_sat_cr: "420-520", 
		  range_sat_math: "440-540", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "18-23", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://studyusa.com/images/ArticleImage-286-en_1.jpg" },

		{ name: "Arizona State University", 
		  city: "Tempe", 
		  state: "Arizona",	
		  website: "www.asu.edu", 
		  total_applicants: 35294, 
		  percent_admitted: 76,	
		  percent_attending: 38, 
		  range_sat_cr: "480-610", 
		  range_sat_math: "500-630", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "21-27", 
		  average_hs_gpa: "3.39", 
		  superscore_sat: "no", 
		  superscore_act: "no", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/e/e8/Asu_campus_1.jpg" },

		{ name: "Assumption College", 
		  city: "Worcester", 
		  state: "Massachusetts",	
		  website: "www.assumption.edu", 
		  total_applicants: 4659, 
		  percent_admitted: 74,	
		  percent_attending: 15, 
		  range_sat_cr: "510-595", 
		  range_sat_math: "510-620", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "23-27", 
		  average_hs_gpa: "3.32", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://www.assumption.edu/sites/default/files/styles/home_page_slider_image/public/homeHeroAdmissions_0.jpg?itok=CRXK4GWj" },

		{ name: "Auburn University", 
		  city: "Auburn", 
		  state: "Alabama",	
		  website: "www.auburn.edu", 
		  total_applicants: 15745, 
		  percent_admitted: 83,	
		  percent_attending: 29, 
		  range_sat_cr: "520-620", 
		  range_sat_math: "540-650", 
		  range_sat_writing: "510-620", 
		  range_act_comp: "24-30", 
		  average_hs_gpa: "3.74", 
		  superscore_sat: "no", 
		  superscore_act: "no", 
		  image_url: "http://images.bwbx.io/cms/2013-06-21/0621_auburn_630x420.jpg" },


		{ name: "Austin College", 
		  city: "Sherman", 
		  state: "Texas",	
		  website: "www.austincollege.edu", 
		  total_applicants: 3138, 
		  percent_admitted: 59,	
		  percent_attending: 12, 
		  range_sat_cr: "540-660", 
		  range_sat_math: "560-670", 
		  range_sat_writing: "520-630", 
		  range_act_comp: "23-27", 
		  average_hs_gpa: "3.56", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.ctcl.org/sites/default/files/austin12.jpg" },

		{ name: "Babson College", 
		  city: "Babson Park", 
		  state: "Massachusetts",	
		  website: "www.babson.edu", 
		  total_applicants: 6086, 
		  percent_admitted: 28,	
		  percent_attending: 28, 
		  range_sat_cr: "550-640", 
		  range_sat_math: "610-700", 
		  range_sat_writing: "580-670", 
		  range_act_comp: "26-29", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://www.capitoldebate.com/wp-content/uploads/2014/05/BABSON_AERIALX600.jpg" },

		{ name: "Bard College", 
		  city: "Annandale-on-Hudson", 
		  state: "New York",	
		  website: "www.bard.edu", 
		  total_applicants: 5466, 
		  percent_admitted: 38,	
		  percent_attending: 24, 
		  range_sat_cr: "600-710", 
		  range_sat_math: "570-670", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "unavailable", 
		  average_hs_gpa: "3.50", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.campusexplorer.com/media/560x420/Bard-College-8F584854.jpg" },

		{ name: "Bard College at Simon's Rock", 
		  city: "Great Barrington", 
		  state: "Massachusetts",	
		  website: "www.simons-rock.edu", 
		  total_applicants: 218, 
		  percent_admitted: 92,	
		  percent_attending: 72, 
		  range_sat_cr: "690-750", 
		  range_sat_math: "600-710", 
		  range_sat_writing: "620-710", 
		  range_act_comp: "24-27", 
		  average_hs_gpa: "3.71", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://i2.cdn.turner.com/dr/hln/www/release/sites/default/files/static/images/5655607835_85e9b61621_o.jpg" },

		{ name: "Barnard College", 
		  city: "New York", 
		  state: "New York",	
		  website: "www.barnard.edu", 
		  total_applicants: 5606, 
		  percent_admitted: 21,	
		  percent_attending: 50, 
		  range_sat_cr: "620-730", 
		  range_sat_math: "620-710", 
		  range_sat_writing: "650-740", 
		  range_act_comp: "28-32", 
		  average_hs_gpa: "3.86", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.themontclarion.org/wordpress/wp-content/uploads/2013/02/barnard-college-campus.jpg" },

		{ name: "Bates College", 
		  city: "Lewiston", 
		  state: "Maine",	
		  website: "www.bates.edu", 
		  total_applicants: 4906, 
		  percent_admitted: 27,	
		  percent_attending: 39, 
		  range_sat_cr: "630-720", 
		  range_sat_math: "630-710", 
		  range_sat_writing: "643-720", 
		  range_act_comp: "30-32", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.bloomberg.com/ss/08/10/1029_college_costs/image/bates.jpg" },

		{ name: "Baylor University", 
		  city: "Waco", 
		  state: "Texas",	
		  website: "www.baylor.edu", 
		  total_applicants: 29249, 
		  percent_admitted: 57,	
		  percent_attending: 19, 
		  range_sat_cr: "550-660", 
		  range_sat_math: "570-670", 
		  range_sat_writing: "530-640", 
		  range_act_comp: "24-29", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://www.bloomberg.com/ss/09/09/0915_college_prowler_ranking/image/045_baylor.jpg" },

		{ name: "Becker College", 
		  city: "Worcester", 
		  state: "Massachusetts",	
		  website: "www.becker.edu", 
		  total_applicants: 3936, 
		  percent_admitted: 63,	
		  percent_attending: 15, 
		  range_sat_cr: "450-550", 
		  range_sat_math: "440-570", 
		  range_sat_writing: "430-520", 
		  range_act_comp: "unavailable", 
		  average_hs_gpa: "3.02", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://colleges.usnews.rankingsandreviews.com/img/college-photo_7966..jpg" },

		{ name: "Bellarmine University", 
		  city: "Louisville", 
		  state: "Kentucky",	
		  website: "www.bellarmine.edu", 
		  total_applicants: 4160, 
		  percent_admitted: 95,	
		  percent_attending: 17, 
		  range_sat_cr: "490-590", 
		  range_sat_math: "490-590", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "22-27", 
		  average_hs_gpa: "3.53", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.bellarmine.edu/sf-images/default-source/photo-tour/quad-large.png?sfvrsn=0" },

		{ name: "Beloit College", 
		  city: "Beloit", 
		  state: "Wisconsin",	
		  website: "www.beloit.edu", 
		  total_applicants: 2253, 
		  percent_admitted: 68,	
		  percent_attending: 20, 
		  range_sat_cr: "550-710", 
		  range_sat_math: "540-660", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "24-30", 
		  average_hs_gpa: "3.43", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://www.visitbeloit.com/uploads//college/beloitcollege-top.jpg" },

		{ name: "Bennington College", 
		  city: "Bennington", 
		  state: "Vermont",	
		  website: "www.bennington.edu", 
		  total_applicants: 1236, 
		  percent_admitted: 63,	
		  percent_attending: 25, 
		  range_sat_cr: "620-720", 
		  range_sat_math: "560-660", 
		  range_sat_writing: "610-700", 
		  range_act_comp: "26-30", 
		  average_hs_gpa: "3.53", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.sparrowhall.com/blog/wp-content/uploads/2011/12/bennington-college-commons-sparrow-hall-web.jpg" },

		{ name: "Bentley University", 
		  city: "Waltham", 
		  state: "Massachusetts",	
		  website: "www.bentley.edu", 
		  total_applicants: 7493, 
		  percent_admitted: 44,	
		  percent_attending: 30, 
		  range_sat_cr: "540-630", 
		  range_sat_math: "600-680", 
		  range_sat_writing: "550-650", 
		  range_act_comp: "26-30", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.addinc.com/webimages/projects/BentleyDormRoom_4_201202091107860.jpg" },

		{ name: "Berea College", 
		  city: "Berea", 
		  state: "Kentucky",	
		  website: "www.berea.edu", 
		  total_applicants: 1606, 
		  percent_admitted: 34,	
		  percent_attending: 72, 
		  range_sat_cr: "510-630", 
		  range_sat_math: "513-610", 
		  range_sat_writing: "483-610", 
		  range_act_comp: "22-26", 
		  average_hs_gpa: "3.42", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://bcnow.berea.edu/wp-content/uploads/2011/04/campus-shot.jpg" },

		{ name: "Boston College", 
		  city: "Chestnut Hill", 
		  state: "Massachusetts",	
		  website: "www.bc.edu", 
		  total_applicants: 24538, 
		  percent_admitted: 32,	
		  percent_attending: 28, 
		  range_sat_cr: "620-710", 
		  range_sat_math: "650-740", 
		  range_sat_writing: "640-730", 
		  range_act_comp: "30-33", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://cdn1.bostonmagazine.com/wp-content/uploads/2013/04/boston-college.jpg" },

		{ name: "Boston University", 
		  city: "Boston", 
		  state: "Massachusetts",	
		  website: "www.bu.edu", 
		  total_applicants: 52705, 
		  percent_admitted: 37,	
		  percent_attending: 20, 
		  range_sat_cr: "570-670", 
		  range_sat_math: "620-720", 
		  range_sat_writing: "600-690", 
		  range_act_comp: "27-31", 
		  average_hs_gpa: "3.59", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://neutrino2014.bu.edu/files/2013/08/503678580503_0_bg.jpg" },

		{ name: "Bowdoin College", 
		  city: "Brunswick", 
		  state: "Maine",	
		  website: "www.bowdoin.edu", 
		  total_applicants: 7052, 
		  percent_admitted: 15,	
		  percent_attending: 47, 
		  range_sat_cr: "680-760", 
		  range_sat_math: "680-750", 
		  range_sat_writing: "690-770", 
		  range_act_comp: "30-33", 
		  average_hs_gpa: "3.80", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.bowdoin.edu/government/images/bowdoin-hubbard-hall-spring-2012.jpg" },

		{ name: "Bradley University", 
		  city: "Peoira", 
		  state: "Illinois",	
		  website: "www.bradley.edu", 
		  total_applicants: 7562, 
		  percent_admitted: 63,	
		  percent_attending: 21, 
		  range_sat_cr: "520-660", 
		  range_sat_math: "510-650", 
		  range_sat_writing: "520-620", 
		  range_act_comp: "23-28", 
		  average_hs_gpa: "3.69", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "" },

		{ name: "Brandeis University", 
		  city: "Waltham", 
		  state: "Massachusetts",	
		  website: "www.brandeis.edu", 
		  total_applicants: 9496, 
		  percent_admitted: 37,	
		  percent_attending: 24, 
		  range_sat_cr: "600-710", 
		  range_sat_math: "630-760", 
		  range_sat_writing: "620-720", 
		  range_act_comp: "28-32", 
		  average_hs_gpa: "3.87", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/5/5d/Bradley_University_Bradley_Hall.jpg" },

		{ name: "Brigham Young University", 
		  city: "Provo", 
		  state: "Utah",	
		  website: "www.byu.edu", 
		  total_applicants: 11603, 
		  percent_admitted: 49,	
		  percent_attending: 78, 
		  range_sat_cr: "570-680", 
		  range_sat_math: "580-680", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "26-31", 
		  average_hs_gpa: "3.80", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/c/cf/BYU_Campus_North.jpg" },

		{ name: "Brown University", 
		  city: "Providence", 
		  state: "Rhode Island",	
		  website: "www.brown.edu", 
		  total_applicants: 28919, 
		  percent_admitted: 9,	
		  percent_attending: 58, 
		  range_sat_cr: "660-760", 
		  range_sat_math: "670-780", 
		  range_sat_writing: "670-770", 
		  range_act_comp: "29-34", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.brown.edu/admission/undergraduate/sites/brown.edu.admission.undergraduate/files/brown_video/poster_images/admissionvideoTITLE_0.png" },

		{ name: "Bryant University", 
		  city: "Smithfield", 
		  state: "Rhode Island",	
		  website: "www.bryant.edu", 
		  total_applicants: 6013, 
		  percent_admitted: 77,	
		  percent_attending: 19, 
		  range_sat_cr: "510-590", 
		  range_sat_math: "540-630", 
		  range_sat_writing: "500-590", 
		  range_act_comp: "23-27", 
		  average_hs_gpa: "3.32", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://02.usjournal.com/img/bryant-fall.jpg" },

		{ name: "Bryn Mawr College", 
		  city: "Bryn Mawr", 
		  state: "Pennsylvania",	
		  website: "www.brynmawr.edu", 
		  total_applicants: 2708, 
		  percent_admitted: 40,	
		  percent_attending: 34, 
		  range_sat_cr: "600-710", 
		  range_sat_math: "610-760", 
		  range_sat_writing: "620-720", 
		  range_act_comp: "27-32", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://www.brynmawr.edu/homeimages/homeimageUC.jpg" },

		{ name: "Bucknell University", 
		  city: "Lewisburg", 
		  state: "Pennsylvania",	
		  website: "www.bucknell.edu", 
		  total_applicants: 7947, 
		  percent_admitted: 30,	
		  percent_attending: 40, 
		  range_sat_cr: "580-680", 
		  range_sat_math: "620-720", 
		  range_sat_writing: "600-690", 
		  range_act_comp: "27-32", 
		  average_hs_gpa: "3.54", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.bloomberg.com/ss/10/10/1028_most_expensive_colleges/image/09_bucknell.jpg" },

		{ name: "California Institute of Technology", 
		  city: "Pasadena", 
		  state: "California",	
		  website: "www.caltech.edu", 
		  total_applicants: 5535, 
		  percent_admitted: 11,	
		  percent_attending: 42, 
		  range_sat_cr: "720-800", 
		  range_sat_math: "770-800", 
		  range_sat_writing: "720-790", 
		  range_act_comp: "33-35", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/c/c0/Fountain_at_Caltech.jpg" },

		{ name: "California State University, Stanislaus", 
		  city: "Turlock", 
		  state: "California",	
		  website: "www.csustan.edu", 
		  total_applicants: 5804, 
		  percent_admitted: 74,	
		  percent_attending: 29, 
		  range_sat_cr: "400-510", 
		  range_sat_math: "410-510", 
		  range_sat_writing: "400-500", 
		  range_act_comp: "16-22", 
		  average_hs_gpa: "3.26", 
		  superscore_sat: "yes", 
		  superscore_act: "yes", 
		  image_url: "http://catalog.csustan.edu/mime/media/13/850/homepage%20photo%2011_12.JPG" },

		{ name: "Calvin College", 
		  city: "Grand Rapids", 
		  state: "Michigan",	
		  website: "www.calvin.edu", 
		  total_applicants: 4001, 
		  percent_admitted: 70,	
		  percent_attending: 36, 
		  range_sat_cr: "518-650", 
		  range_sat_math: "530-660", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "23-29", 
		  average_hs_gpa: "3.66", 
		  superscore_sat: "no", 
		  superscore_act: "no", 
		  image_url: "https://oldalexius.files.wordpress.com/2014/02/hekman-library-general-view-calvin-college-large.jpg" },

		{ name: "Carleton College", 
		  city: "Northfield", 
		  state: "Minnesota",	
		  website: "www.carleton.edu", 
		  total_applicants: 7045, 
		  percent_admitted: 21,	
		  percent_attending: 36, 
		  range_sat_cr: "660-750", 
		  range_sat_math: "680-770", 
		  range_sat_writing: "660-750", 
		  range_act_comp: "29-33", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/9/98/Carleton_College_Aerial.jpg" },

		{ name: "Carngie Mellon University", 
		  city: "Pittsburgh", 
		  state: "Pennsylvania",	
		  website: "www.cmu.edu", 
		  total_applicants: 18884, 
		  percent_admitted: 25,	
		  percent_attending: 30, 
		  range_sat_cr: "640-740", 
		  range_sat_math: "700-790", 
		  range_sat_writing: "650-750", 
		  range_act_comp: "30-34", 
		  average_hs_gpa: "3.72", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://www.cmu.edu/multimedia/images/wallpapers/cmu-student-pride.jpg" },

		{ name: "Case Western Reserve University", 
		  city: "Cleveland", 
		  state: "Ohio",	
		  website: "www.case.edu", 
		  total_applicants: 18418, 
		  percent_admitted: 42,	
		  percent_attending: 16, 
		  range_sat_cr: "600-720", 
		  range_sat_math: "670-760", 
		  range_sat_writing: "620-710", 
		  range_act_comp: "29-33", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://upload.wikimedia.org/wikipedia/commons/3/38/Case_western_reserve_campus_2005.jpg" },

		{ name: "Catawba College", 
		  city: "Salisbury", 
		  state: "North Carolina",	
		  website: "www.catawba.edu", 
		  total_applicants: 3226, 
		  percent_admitted: 41,	
		  percent_attending: 26, 
		  range_sat_cr: "420-540", 
		  range_sat_math: "430-550", 
		  range_sat_writing: "unavailable", 
		  range_act_comp: "18-23", 
		  average_hs_gpa: "unavailable", 
		  superscore_sat: "yes", 
		  superscore_act: "no", 
		  image_url: "http://cdn87.psbin.com/img/mw=620/mh=540/cr=y/d=c2ue5/senroszbidwg49re.jpg" }


		]


		School.delete_all

		SCHOOLS.each do |s|
			School.create(s)
		end 
	end 
end 