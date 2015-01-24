#used to direct user to proper home page

#I GIVE UP. THIS ISN'T WORKING YET!

class HomeController < ApplicationController
def index
  #I think, below, we need three cases: one student writer, one student promoter, and one admin
  #Also, I believe this should be called index to remain consistent so I changed it but can be changed back if needed
    case
    when @user.student?
      reader_home #role = reader
    when @user.admin?
      promoter_home #role = promoter
    else
      # Unknown user type? Render error or use a default...
    end
  end
end

protected
  def reader_home
    # ...
    render(:template => 'admin_home') #FIX
  end

  def promoter_home
    # ...
    render(:template => 'admin_home') #FIX
  end
end