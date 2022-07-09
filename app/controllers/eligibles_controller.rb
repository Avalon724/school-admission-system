class EligiblesController < ApplicationController
  before_action :require_admin_logged_in!

  def edit
    @eligible = Eligible.find_by(id: params[:id])
  end

  def update
    @eligible = Eligible.includes([:section]).find_by(id: params[:id])
    if @eligible.update(form_params)
      redirect_to section_path, notice: "Updated criteria successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @eligible = Eligible.find_by(id: params[:id])
    if @eligible.destroy
      redirect_to section_path, notice: "Deleted Criteria successfully!"
    else
      render :destroy, alert: "Failed to delete required criteria!"
    end
  end

  def create
    @section_id = params[:section_id]
    @eligible = Eligible.new(form_params)
    if @eligible.save
      redirect_to section_path, notice: "Added Eligibility Crteria!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @section_id = params[:section_id]
    @eligible = Eligible.new
  end

  private

  def form_params
    params.require(:eligible).permit(:age, :grade, :section_id)
  end
end
