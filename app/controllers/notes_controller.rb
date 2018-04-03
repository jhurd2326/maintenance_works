# frozen_string_literal: true

class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note.request
    else
      redirect_to @note.request, notice: @note.errors.full_messages.to_sentence
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :request_id)
  end
end
