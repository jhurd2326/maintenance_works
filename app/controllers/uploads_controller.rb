# frozen_string_literal: true

class UploadsController < ApplicationController
  def new
    @upload = SpreadsheetUpload.new
  end

  def create
    @upload = SpreadsheetUpload.new(upload_params.merge(user: current_user))
    if @upload.process_files
      redirect_to dashboard_path, notice: "File upload successful"
    else
      flash.now[:notice] = "File upload unsuccessful"
      render :new
    end
  end

  private

  def upload_params
    params.require(:spreadsheet_upload).permit(files: [])
  end
end
