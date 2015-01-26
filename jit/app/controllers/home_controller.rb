#used to direct user to proper home page

#I GIVE UP. THIS ISN'T WORKING YET!

class HomeController < ApplicationController

#where should devise's before filer go? to verify that user is signed in before making any actions... (see devise site)

def index 
  
    if user_signed_in?
      redirect_to :controller => 'questions', action => 'index'
    end
end

#...


end