class Effects::AccessController < Effects::BaseController
  
  helper_method :bgcolor

private

  def bgcolor
    '#ffffff'
  end

  def configuration_from_params_and_defaults
    {
      header_text: sanitize(params[:header_text]),
      mode: sanitize(params[:mode]),
      username_label: sanitize(params[:username_label]) || default_config[:username_label],
      password_label: sanitize(params[:password_label]) || default_config[:password_label],
      username_placeholder: sanitize(params[:username_placeholder]) || default_config[:username_placeholder],
      login_button_label: sanitize(params[:login_button_label]) || default_config[:login_button_label],
      access_denied_text: sanitize(params[:access_denied_text]) || default_config[:access_denied_text],
      access_granted_text: sanitize(params[:access_granted_text]) || default_config[:access_granted_text],
      correct_password: sanitize(params[:correct_password]) || default_config[:correct_password],
      max_retries: params[:max_retries].to_i || default_config[:max_retries],
      redirect_delay: params[:redirect_delay].to_i || default_config[:redirect_delay],
      success_redirect_url: params[:success_redirect_url] || default_config[:success_redirect_url],
      failure_redirect_url: params[:failure_redirect_url] || default_config[:failure_redirect_url]
    }
  end

  def default_config
    {
      username_label: 'Username',
      password_label: 'Password',
      username_placeholder: 'Type your username here',
      login_button_label: 'Login',
      access_denied_text: 'Access Denied',
      access_granted_text: 'Access Granted',
      correct_password: '123qaz',
      max_retries: 3,
      redirect_delay: 0
    }
  end

  def effect_name
    'access'
  end

  def route
    'access'
  end

  def session_saved_config
    SavedConfiguration.find_by(session_id: request.session.id)
  end
end
