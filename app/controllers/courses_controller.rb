class CoursesController < ApplicationController
  
  
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @course = Course.all
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
    @course = Course.find(params[:id])
    @student = @course.student
  end
  
  def view
    @course = Course.all
    render 'view'
  end
  
  def grades
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin" || current_user.type == "Instructor")
      @grades = Grade.where("course_id = ?", params[:course_id])
    else
      redirect_to static_pages_home_url
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
