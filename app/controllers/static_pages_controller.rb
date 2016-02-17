class StaticPagesController < ApplicationController
  def home
  end
  def admin
    if !logged_in? || (current_user.privilege == "admin" && !current_user.privilege == "superadmin")
      redirect_to static_pages_home_url
    end
  end
  def student
    if !logged_in? || !current_user.privilege == "student"
      redirect_to static_pages_home_url
    end
  end
end
