# frozen_string_literal: true

class SpreadsheetUploadWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(upload_params)
    @upload = SpreadsheetUpload.new(upload_params)
    @upload.process_files
  end
end
