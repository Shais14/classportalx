class StaticPagesController < ApplicationController
  def home
    if logged_in?
      if current_user.privilege == "admin" || current_user.privilege == "superadmin"
        redirect_to static_pages_admin_url
      elsif current_user.privilege == "instructor"
        redirect_to static_pages_instructor_url
      elsif current_user.privilege == "student"
        redirect_to static_pages_student_url
      end
    end
  end
  def admin
    if !logged_in? || (current_user.privilege == "admin" && !current_user.privilege == "superadmin")
      redirect_to static_pages_home_url
    end
  end
  
  def instructor
    if !logged_in? || !current_user.privilege == "instructor"
      redirect_to static_pages_home_url
    end
  end
  
  def student
    if !logged_in? || !current_user.privilege == "student"
      redirect_to static_pages_home_url
    end
  end
end
