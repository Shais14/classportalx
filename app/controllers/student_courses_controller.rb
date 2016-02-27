class StudentCoursesController < ApplicationController
  def grades
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin" || current_user.type == "Instructor")
      @students_courses = StudentCourse.where("course_id = ?", params[:course_id])
    else
      redirect_to static_pages_home_url
    end
  end
  
  def showEnrollmentRequests
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin" || current_user.type == "Instructor")
      @students_courses = StudentCourse.where("requested = ?", true)
    else
      redirect_to static_pages_home_url
    end
  end
  
  def approveRequest
    @student_course = StudentCourse.where("student_id = ?", params[:student_id]).where("course_id = ?", params[:course_id]).first
    
    if !@student_course.blank?
      @student_course.requested = false
      @student_course.enrolled = true
      if @student_course.save
        @user_history = UserHistory.new
        @user_history.user_id = params[:student_id]
        @user_history.course_id = params[:course_id]
        @user_history.action = "enroll"
        #No error if history doesn't save
        @user_history.save
        #if @user_history.save
        flash[:success] = "Enrollment request approved"
        redirect_to '/enrollmentRequests'
      else
        flash[:error] = "There was an error approving the enrollment request"
        redirect_to '/enrollmentRequests'
      end
    else
      flash[:error] = "There was an error approving the enrollment request"
      redirect_to '/enrollmentRequests'
    end
  end
  
   def denyRequest
    @student_course = StudentCourse.where("student_id = ?", params[:student_id]).where("course_id = ?", params[:course_id]).first
    
    if !@student_course.blank?
      if @student_course.destroy
        flash[:success] = "Enrollment request succesfully denied"
        redirect_to '/enrollmentRequests'
      else
        flash[:error] = "There was an error denying the enrollment request"
        redirect_to '/enrollmentRequests'
      end
    else
      flash[:error] = "The enrollment request has already been denied"
      redirect_to '/enrollmentRequests'
    end
  end

  def viewHistory
    
  end
end