# frozen_string_literal: true

class RequestsController < ApplicationController
  def new
    @request = Request.new
    @request.notes.build
  end

  def create
    @request = Request.new(request_params)
    @request.notes.each { |note| note.user_id = @request.user_id }
    # Temporary Fix for adding hospital_id
    @request.hospital_id = 1
    if @request.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:device_id, :repairable,
      notes_attributes: [:content]).merge(user_id: current_user.id)
  end
end
