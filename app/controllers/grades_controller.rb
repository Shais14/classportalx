class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    if logged_in?
      if current_user.type == "Student"
        @students_courses = StudentCourse.where(student_id: current_user.id).where.not(grade: '')
      elsif current_user.type == "Admin" || current_user.type == "SuperAdmin"
        @students_courses = StudentCourse.where.not(grade: '')
      end
    else
      redirect_to static_pages_home_url
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @student_course = StudentCourse.new
  end

  # GET /grades/1/edit
  def edit
    @student_course = StudentCourse.find(params[:student_course_id])
  end

  # POST /grades
  # POST /grades.json
  def create
    @student_course = StudentCourse.where(student_id: params[:student_course][:student_id]).where(course_id: params[:student_course][:course_id]).first
    
     if @student_course.blank?
        flash.now[:danger] = 'This student is not enrolled in this course' # Not quite right!
        @student_course = StudentCourse.new
        render 'new'
     else
      respond_to do |format|
          #format.html { render action: 'new' }
          #format.json { render json: @student_course.errors, status: :unprocessable_entity }
        if @student_course.update_attribute(:grade, params[:student_course][:grade])
          format.html { redirect_to grades_url, notice: 'Grade was successfully created.' }
          format.json { render action: 'show', status: :created, location: @student_course }
        else
          format.html { render action: 'new' }
          format.json { render json: @student_course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      #@student_course = StudentCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:student_id, :course_id, :value)
    end
end
