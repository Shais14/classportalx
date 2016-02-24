class CoursesController < ApplicationController
  
  
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if params[:course_title] || params[:course_number] || params[:course_instructor] || params[:course_description] || params[:course_status]
        @course = Course.where("title = ? OR number = ? OR instructor =? OR description = ? OR status =?", params[:course_title], params[:course_number],params[:course_instructor], params[:course_description], params[:course_status]).order("created_at DESC")
        render 'viewSelectCourse'
    else
      @course =Course.all
      render 'view'
    end
    
  end
  
  
  def viewSelectCourse
    
  end



  def searchCourse
      
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
     @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/edit
  def edit
     @course = Course.find(params[:id])
     render 'edit'
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to static_pages_admin_url, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/edit
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to  viewCourse_path, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
  def details
    @course =  Course.find(params[:id])
    render 'details'
  end
  
  def enroll
    @course =  Course.find(params[:id])
    redirect_to static_pages_admin_url  #just a random link.
  
  end
  
  def view
    @course = Course.all
    render 'view'
  end
  
  def students
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin" || current_user.type == "Instructor")
      @students_courses = StudentCourse.where("course_id = ?", params[:course_id])
    else
      redirect_to static_pages_home_url
    end
  end
  
  def requestEnrollment
    if logged_in? && (current_user.type == "Student")
      @student_course = StudentCourse.where("course_id = ?", params[:course_id]).where("student_id = ?", current_user.id).first
      
      if @student_course.blank?
        @student_course = StudentCourse.new
        @student_course.student_id = current_user.id
        @student_course.course_id = params[:course_id]
        @student_course.requested = true
        
        if @student_course.save
          flash[:success] = "Enrollment request received"
          redirect_to static_pages_home_url
        elsif
          flash[:error] = "There was an error processing your enrollment request"
          redirect_to static_pages_home_url
        end
      elsif !@student_course.requested
        @student_course.requested = true
          if @student_course.save
            flash[:success] = "Enrollment request received"
            redirect_to static_pages_home_url
          elsif
            flash[:error] = "There was an error processing your enrollment request"
            redirect_to static_pages_home_url
          end
      else
        flash[:error] = "You have already requested enrollment for this course"
        redirect_to static_pages_home_url
      end
    else
      redirect_to static_pages_home_url
      
    end
  end
  
  def drop
    @student_course = StudentCourse.where("course_id = ?", params[:course_id]).where("student_id = ?", current_user.id).first
    
    if !@student_course.blank?
      if @student_course.destroy
        flash[:success] = "You successfully dropped the course"
        redirect_to static_pages_home_url
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
       params.require(:course).permit(:number, :title, :description, :instructor, :start_date, :end_date, :status)
    end
end
