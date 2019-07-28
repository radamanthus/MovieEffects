class Effects::ProcessingController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  DEFAULT_CONFIG = {
    start_position: 0,
    start_button_label: 'Proceed',
    start_text: 'Are you sure you want to download the virus?',
    step_delay: 1000,
    step_increment: 1,
    processing_text: 'Downloading Virus...',
    progress_bar_color: 'blue'
  }

  def create
    start_position = sanitize(params[:start_position]).to_i || DEFAULT_CONFIG[:start_position]
    start_button_label = sanitize(params[:start_button_label]) || DEFAULT_CONFIG[:start_button_label]
    start_text = sanitize(params[:start_text]) || DEFAULT_CONFIG[:start_text]
    step_delay = sanitize(params[:step_delay]).to_i || DEFAULT_CONFIG[:step_delay]
    step_increment = sanitize(params[:step_increment]).to_i || DEFAULT_CONFIG[:step_increment]
    processing_text = sanitize(params[:processing_text]) || DEFAULT_CONFIG[:processing_text]
    progress_bar_color = sanitize(params[:progress_bar_color]) || DEFAULT_CONFIG[:progress_bar_color]

    configuration = {
      processing_text: processing_text,
      progress_bar_color: progress_bar_color,
      start_position: start_position,
      start_button_label: start_button_label,
      start_text: start_text,
      step_delay: step_delay,
      step_increment: step_increment
    }

    saved_config = SavedConfiguration.new({
      session_id: request.session.id,
      effect: 'processing',
      configuration: configuration
    })
    saved_config.save!
    redirect_to edit_effects_processing_path({id: saved_config.slug})
  end

  def edit
    saved = SavedConfiguration.find_by slug:params[:id]
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    permalink = "#{request.protocol}#{Settings.hostname}/effects/processing/#{saved.slug}"
    edit_url = "#{permalink}/edit"
    render locals:{
      id: saved.id, 
      permalink: permalink, 
      edit_url: edit_url, 
      config: config
    }
  end

  def new
    saved = SavedConfiguration.new(configuration: DEFAULT_CONFIG)
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    render locals:{config: config}
  end

  def show
    saved = SavedConfiguration.find_by slug:params[:id]
    @bgcolor = '#1b1c1d'
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    start_position = config[:start_position]
    start_button_label = config[:start_button_label]
    start_text = config[:start_text]
    step_delay = config[:step_delay]
    step_increment = config[:step_increment]
    processing_text = config[:processing_text]
    progress_bar_color = config[:progress_bar_color]
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

  def update
    start_position = sanitize(params[:start_position]).to_i || DEFAULT_CONFIG[:start_position]
    start_button_label = sanitize(params[:start_button_label]) || DEFAULT_CONFIG[:start_button_label]
    start_text = sanitize(params[:start_text]) || DEFAULT_CONFIG[:start_text]
    step_delay = sanitize(params[:step_delay]).to_i || DEFAULT_CONFIG[:step_delay]
    step_increment = sanitize(params[:step_increment]).to_i || DEFAULT_CONFIG[:step_increment]
    processing_text = sanitize(params[:processing_text]) || DEFAULT_CONFIG[:processing_text]
    progress_bar_color = sanitize(params[:progress_bar_color]) || DEFAULT_CONFIG[:progress_bar_color]

    configuration = {
      processing_text: processing_text,
      progress_bar_color: progress_bar_color,
      start_position: start_position,
      start_button_label: start_button_label,
      start_text: start_text,
      step_delay: step_delay,
      step_increment: step_increment
    }

    saved_config = SavedConfiguration.find(params[:id])
    saved_config.configuration = configuration
    saved_config.save!
    redirect_to effects_processing_path({id: saved_config.slug})
  end

private

  def session_saved_config
    SavedConfiguration.find_by(session_id:request.session.id)
  end
end
