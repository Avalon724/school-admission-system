class InterviewsController < ApplicationController
  def index
    @interview = Interview.where(student_id: params[:student_id])
    @student = Student.find_by(id: params[:student_id])
  end

  def new
    @student = Student.find_by(id: params[:student_id])
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(form_params)
    puts @interview
    if @interview.save
      redirect_to student_interviews_path(@interview.student_id), notice: "Scheduled an interview"
      message = "Interview is scheduled for #{@interview.student.name} on #{@interview.schedule.strftime("%e %b, %Y")} at #{@interview.schedule.strftime("%I:%M %p")}"
      notify(@interview.student.user_id, message)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @interview = Interview.find_by(id: params[:id])
    if @interview.update(form_params)
      if @interview.status == "passed"
        redirect_back fallback_location: applied_students_path, notice: "Interview flagged as passed"
        message = "#{@interview.student.name} has passed the interview scheduled on #{@interview.schedule.strftime("%e %b, %Y")} at #{@interview.schedule.strftime("%I:%M %p")}"
        notify(@interview.student.user_id, message)
      elsif @interview.status == "failed"
        redirect_back fallback_location: applied_students_path, notice: "Interview flagged as failed"
        message = "#{@interview.student.name} has failed the interview scheduled on #{@interview.schedule.strftime("%e %b, %Y")} at #{@interview.schedule.strftime("%I:%M %p")}"
        notify(@interview.student.user_id, message)
      end
    else
      render :update, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @interview = Interview.find_by(id: params[:id])
    if @interview.destroy
      redirect_back fallback_location: applied_students_path, notice: "Interview cancelled"
      message = "#{@interview.student.name}'s interview on #{@interview.schedule.strftime("%e %b, %Y")} at #{@interview.schedule.strftime("%I:%M %p")} has been cancelled"
      notify(@interview.student.user_id, message)
    else
      render :destroy, alert: "Failed to cancel interview"
    end
  end

  private

  def form_params
    params.require(:interview).permit(:status, :schedule, :student_id)
  end
end
