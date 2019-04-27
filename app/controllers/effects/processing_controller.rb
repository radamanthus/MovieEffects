class Effects::ProcessingController < ApplicationController
  def index
    start_position = params[:start_position].to_i || 0
    step_delay = params[:step_delay].to_i || 100
    processing_text = params[:processing_text] || 'Processing...'
    render locals: {
      processing_text: processing_text,
      start_position: start_position,
      step_delay: step_delay
    }
  end

  def configure
  end
end
