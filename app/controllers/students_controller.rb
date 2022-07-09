class StudentsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    if (Current.user.admin == true)
      @student = Student.includes(:photo_attachment).order(:name)
    else
      @student = Current.user.students.includes(:photo_attachment)
    end
  end

  def new
    @student = Student.new
    @options = Section.where(value: true).map { |u| [u.name, u.id] }
  end

  def create
    @options = Section.where(value: true).map { |u| [u.name, u.id] }
    @student = Current.user.students.new(student_params)
    if @student.save
      StudentMailer.with(user: @student.user.email).student_added.deliver_later
      redirect_to students_path, notice: "Successfully applied!"
    else
      render :new, status: :unprocessable_entity
    end
    puts @student.to_json()
  end

  def show
    # binding.pry
    @student = Student.find_by(id: params[:id])
    student_login_auth_check
  end

  def edit
    @student = Student.find_by(id: params[:id])
    @options = Section.where(value: true).map { |u| [u.name, u.id] }
    # student_login_auth_check
  end

  def update
    @student = Student.find_by(id: params[:id])
    @options = Section.where(value: true).map { |u| [u.name, u.id] }
    if Current.user.admin == false
      if @student.update(student_params)
        redirect_to students_path, notice: "Updated successfully!"
      else
        render :edit
      end
    else
      # binding.pry
      if @student.update(student_params)
        # binding.pry
        redirect_to students_path, notice: "Updated changes as an admin!"
      else
        render :edit
      end
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    if @student.destroy
      redirect_to students_path, notice: "Deleted successfully!"
    else
      render :index, alert: "Failed to delete application!"
    end
  end

  private

  def student_login_auth_check
    if (Current.user.id != @student.user_id && Current.user.admin == false)
      redirect_to students_path, alert: "You are not an authorized user for this student"
    end
  end

  def student_params
    params.require(:student).permit(:name, :age, :marksheet, :father, :mother, :address, :pnumber, :prevgrade, :photo, :section_id, :user_id)
  end
end
