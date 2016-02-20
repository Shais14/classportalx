class StudentCoursesController < ApplicationController
  def grades
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin" || current_user.type == "Instructor")
      @students_courses = StudentCourse.where("course_id = ?", params[:course_id])
    else
      redirect_to static_pages_home_url
    end
  end
end