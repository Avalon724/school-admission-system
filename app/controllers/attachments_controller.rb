class AttachmentsController < ApplicationController
  def purge
    attachment = ActiveStorage::Attachment.find_by(id: params[:id])
    attachment.purge_later
    redirect_back fallback_location: student_path, notice: "Deleted attachment"
  end
end
