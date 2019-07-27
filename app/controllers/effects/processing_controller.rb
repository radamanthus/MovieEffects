class Effects::ProcessingController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  def index

    @bgcolor = '#1b1c1d'
    start_position = sanitize(params[:start_position]).to_i || 0
    start_button_label = sanitize(params[:start_button_label]) || 'Proceed'
    start_text = sanitize(params[:start_text]) || 'Are you sure you want to download the virus?'
    step_delay = sanitize(params[:step_delay]).to_i || 1000
    step_increment = sanitize(params[:step_increment]).to_i || 1
    processing_text = sanitize(params[:processing_text]) || 'Downloading Virus...'
    progress_bar_color = sanitize(params[:progress_bar_color]) || 'blue'
    render layout: 'effects', 
      locals: {
        processing_text: processing_text,
        progress_bar_color: progress_bar_color,
        start_position: start_position,
        start_button_label: start_button_label,
        start_text: start_text,
        step_delay: step_delay,
        step_increment: step_increment
      }
  end

  def configure
  end
end