# frozen_string_literal: true

class HospitalsController < ApplicationController
  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to dashboard_path, notice: "Hospital successfully created"
    else
      flash.now[:notice] = @hospital.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name, :country, :address, :city, :phone_number)
  end
end
