# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :find_or_create_device, only: [:create]

  def index
    @requests = Request.all.page(params[:page]).per(20)
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    # Temporary Fix for adding hospital_id
    @request.hospital_id = 1
    if @request.save
      create_note
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:problem_type, :manufacturer, :model, :serial_number,
      :equipment_type, :note_content).merge(request_hash)
  end

  def request_hash
    { user_id: current_user.id, device: @device, repaired: false, abandoned: false }
  end

  def find_or_create_device
    @device = Device.find_or_create_by(model: request_params[:model],
                                       serial_number: request_params[:serial_number]) do |device|
      device.equipment_type = request_params[:equipment_type]
      device.manufacturer = request_params[:manufacturer]
      device.hospital_id = 1
    end
  end

  def create_note
    return if request_params[:note_content].blank?
    Note.create(content: request_params[:note_content], user: @request.user, request: @request)
  end
end
