# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :find_or_create_device, only: [:create]

  def index
    @requests = Request.includes(:device).order(created_at: :desc).search(params[:q]).page(params[:page]).per(15)
  end

  def show
    @request = Request.find(params[:id])
    @note = Note.new(request: @request, user: current_user)
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
      flash.now[:notice] = @request.errors.full_messages.to_sentence
      render :new
    end
  end

  def abandoned
    Request.find(params[:id]).update(abandoned: true)
    redirect_to requests_path
  end

  def repaired
    Request.find(params[:id]).update(repaired: true)
    redirect_to requests_path
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
