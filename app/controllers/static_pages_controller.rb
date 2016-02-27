class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      if current_user.type == "Admin" || current_user.type == "SuperAdmin"
        redirect_to static_pages_admin_url
      elsif current_user.type == "Instructor"
        redirect_to static_pages_instructor_url
      elsif current_user.type == "Student"
        redirect_to static_pages_student_url
      end
    end
  end
  def admin
    if !logged_in? || (current_user.type == "Admin" && !current_user.type == "SuperAdmin")
      redirect_to static_pages_home_url
    end
  end
  
  def instructor
    if !logged_in? || !current_user.type == "Instructor"
      redirect_to static_pages_home_url
    end
  end
  
  def student
    if !logged_in? || !current_user.type == "Student"
      redirect_to static_pages_home_url
    end
  end
end
