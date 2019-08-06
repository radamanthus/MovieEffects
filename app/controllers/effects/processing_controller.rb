class Effects::ProcessingController < Effects::BaseController
  helper_method :bgcolor

private

  def bgcolor
    '#1b1c1d'
  end

  def configuration_from_params_and_defaults
    {
      processing_text: sanitize(params[:processing_text]) || default_config[:processing_text],
      progress_bar_color: sanitize(params[:progress_bar_color]) || default_config[:progress_bar_color],
      start_position: sanitize(params[:start_position]).to_i || default_config[:start_position],
      start_button_label: sanitize(params[:start_button_label]) || default_config[:start_button_label],
      start_text: sanitize(params[:start_text]) || default_config[:start_text],
      step_delay: sanitize(params[:step_delay]).to_i || default_config[:step_delay],
      step_increment: sanitize(params[:step_increment]).to_i || default_config[:step_increment]
    }
  end

  def default_config
    {
      start_position: 0,
      start_button_label: 'Proceed',
      start_text: 'Are you sure you want to download the virus?',
      step_delay: 1000,
      step_increment: 1,
      processing_text: 'Downloading Virus...',
      progress_bar_color: 'blue'
    }
  end

  def effect_name
    'processing'
  end

  def route
    'processing'
  end

  def session_saved_config
    SavedConfiguration.find_by(session_id: request.session.id)
  end
end
