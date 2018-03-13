# frozen_string_literal: true

class SpreadsheetUpload
  include ActiveModel::Model

  attr_accessor :files, :user, :date_cell, :country_cell, :engineer_name_cell, :hospital_cell,
    :first_request_row, :equipment_type_col, :manufacturer_col, :model_number_col,
    :serial_number_col, :plumbing_prob_col, :motor_prob_col, :electric_prob_col,
    :mechanical_prob_col, :power_prob_col, :installation_prob_col, :other_prob_col,
    :notes_col, :repaired_col, :abandoned_col

  def process_files
    set_config
    files.each do |file|
      read_spreadsheet(file)
    end
  rescue StandardError
    false
  end

  private

  def read_spreadsheet(file)
    @spreadsheet = Roo::Spreadsheet.open(file)
    return false unless @spreadsheet
    process_spreadsheet
  end

  def process_spreadsheet
    # Temporary fix for searching for hospital
    @curr_hospital = Hospital.first

    entry_count.times do |i|
      curr_row = i + @first_request_row
      device = update_or_create_device(curr_row)
      request = update_or_create_request(device, curr_row)
      create_note(request, curr_row)
    end
    @entry_count = nil
  end

  def update_or_create_device(curr_row)
    device = Device.find_or_initialize_by(device_params(curr_row))
    device.manufacturer ||= @spreadsheet.cell(curr_row, @manufacturer_col)
    device.manufacturer = "VOID" if device.manufacturer.blank?
    device.save
    device
  end

  def device_params(curr_row)
    {
      equipment_type: @spreadsheet.cell(curr_row, @equipment_type_col) || "Other",
      model: (@spreadsheet.cell(curr_row, @model_number_col) || "VOID").to_s.upcase,
      serial_number: (@spreadsheet.cell(curr_row, @serial_number_col) || "VOID").to_s.upcase,
      hospital: @curr_hospital,
    }
  end

  def update_or_create_request(device, curr_row)
    request = Request.find_or_initialize_by(hospital: @curr_hospital, device: device)
    request.repaired = true unless @spreadsheet.cell(curr_row, @repaired_col).blank?
    request.abandoned = true unless @spreadsheet.cell(curr_row, @abandoned_col).blank?
    request.problem_type = determine_problem_type(curr_row)
    request.user = @user
    request.save
    request
  end

  def create_note(request, curr_row)
    note_content = @spreadsheet.cell(curr_row, @notes_col)
    return if note_content.blank?
    note = Note.find_or_initialize_by(request: request, content: note_content)
    note.user = @user
    note.save
    note
  end

  def determine_problem_type(curr_row)
    if @spreadsheet.cell(curr_row, @plumbing_prob_col).present?
      "plumbing"
    elsif @spreadsheet.cell(curr_row, @motor_prob_col).present?
      "motor"
    elsif @spreadsheet.cell(curr_row, @electric_prob_col).present?
      "electrical"
    elsif @spreadsheet.cell(curr_row, @mechanical_prob_col).present?
      "mechanical"
    elsif @spreadsheet.cell(curr_row, @power_prob_col).present?
      "power"
    elsif @spreadsheet.cell(curr_row, @installation_prob_col).present?
      "training_installation"
    else
      "other"
    end
  end

  def entry_count
    @entry_count ||= @spreadsheet.column(@equipment_type_col).drop(@first_request_row - 1).compact.count
  end

  def set_config
    assign_attributes Rails.configuration.csv
    @user = User.find(@user)
  end
end
