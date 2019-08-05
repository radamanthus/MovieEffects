class Effects::BaseController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  helper_method :bgcolor

  def create
    saved_config = SavedConfiguration.new({
      session_id: request.session.id,
      effect: effect_name,
      configuration: configuration_from_params_and_defaults
    })
    saved_config.save!
    redirect_to edit_path(saved_config)
  end

  def edit
    saved = SavedConfiguration.find_by slug:params[:id]
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    permalink = "#{request.protocol}#{Settings.hostname}/effects/#{route}/#{saved.slug}"
    edit_url = "#{permalink}/edit"
    render locals:{
      id: saved.id, 
      permalink: permalink, 
      edit_url: edit_url, 
      config: config
    }
  end

  def new
    saved = SavedConfiguration.new(configuration: default_config)
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    render locals:{config: config}
  end

  def show
    saved = SavedConfiguration.find_by slug:params[:id]
    config = ActiveSupport::HashWithIndifferentAccess.new(saved.configuration)
    render layout: 'effects', locals: {
      config: config
    }
  end

  def update
    saved_config = SavedConfiguration.find(params[:id])
    saved_config.configuration = configuration_from_params_and_defaults
    saved_config.save!
    redirect_to show_path(saved_config)
  end

private

  def edit_path(saved_config)
    self.public_send("edit_effects_#{route}_path", {id: saved_config.slug})
  end

  def show_path(saved_config)
    self.public_send("effects_#{route}_path", {id: saved_config.slug})
  end

end