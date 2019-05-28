class Effects::AccessController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  def index

    @bgcolor = '#ffffff'
    header_text = sanitize(params[:header_text])
    mode = sanitize(params[:mode])
    username_label = sanitize(params[:username_label]) || 'Username'
    password_label = sanitize(params[:password_label]) || 'Password'
    username_placeholder = sanitize(params[:username_placeholder]) || 'Type your username here'
    login_button_label = sanitize(params[:login_button_label]) || 'Login'
    access_denied_text = sanitize(params[:access_denied_text]) || 'Access Denied'
    access_granted_text = sanitize(params[:access_granted_text]) || 'Access Granted'
    correct_password = sanitize(params[:correct_password]) || '123qaz'
    max_retries = sanitize(params[:max_retries]).to_i || 3
    redirect_delay = 0
    success_redirect_url = ''
    failure_redirect_url = ''

    render layout: 'effects', 
      locals: {
        header_text: header_text,
        mode: mode,
        username_label: username_label,
        password_label: password_label,
        username_placeholder: username_placeholder,
        login_button_label: login_button_label,
        access_denied_text: access_denied_text,
        access_granted_text: access_granted_text,
        correct_password: correct_password,
        max_retries: max_retries,
        redirect_delay: redirect_delay,
        success_redirect_url: success_redirect_url,
        failure_redirect_url: failure_redirect_url
      }
  end

  def configure
  end
end
