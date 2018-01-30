# frozen_string_literal: true

class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id)
  end
end
