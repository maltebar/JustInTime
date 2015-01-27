#used to direct user to proper home page

class HomeController < ApplicationController

def index 
	if current_user.admin?
		redirect_to(assignments_path)
	else #NOT SUFFICIENT...
		redirect_to(questions_path)
	end
end

#...


end