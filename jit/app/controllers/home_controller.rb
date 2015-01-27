#used to direct user to proper home page

class HomeController < ApplicationController

#where should devise's before filer go? to verify that user is signed in before making any actions... (see devise site)

def index 
	if current_user.admin?
		redirect_to(assignments_path)
	else
		redirect_to(questions_path)
	end
end

#...


end