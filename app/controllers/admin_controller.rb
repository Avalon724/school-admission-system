class AdminController < ApplicationController
  before_action :require_admin_logged_in!

  def index
    section = Section.all.order(:id).to_a
    @sec = []
    section.each do |s|
      @sec.push([s.name, s.value])
    end
  end

  def edit
    section = Section.all.order(:id).to_a
    @sec = []
    section.each do |s|
      @sec.push([s.name, s.value])
    end
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_form_params)
    if @section.save
      redirect_to admin_path, notice: "Successfully added a new section!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if form_params.present?
      form = form_params[:name]
      Section.update_all(value: false)
      form.each do |f|
        Section.find_by(name: f).update(value: true)
      end
    else
      Section.update_all(value: false)
    end
    redirect_to section_path, notice: "Changes are successful!"
  end

  def show
    @section = find_section()
  end

  def delete
    @section = find_section()
    if @section.destroy
      redirect_to admin_path, notice: "Section deleted!"
    else
      render :delete, alert: "Failed to delete the section!"
    end
  end

  private

  def find_section
    Section.find_by(name: params[:name])
  end

  def form_params
    if params[:@sec].present?
      params.require(:@sec)
    end
  end

  def section_form_params
    params.require(:section).permit(:name, :value)
  end
end
