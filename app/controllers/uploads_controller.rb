# frozen_string_literal: true

class UploadsController < ApplicationController
  def new
    @upload = SpreadsheetUpload.new
  end

  def create
    SpreadsheetUploadWorker.perform_async(files: upload_params[:files].map(&:path), user: current_user.id)
    redirect_to dashboard_path
  end

  private

  def upload_params
    params.require(:spreadsheet_upload).permit(files: [])
  end
end
