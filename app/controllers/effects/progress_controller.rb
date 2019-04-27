class Effects::ProgressController < ApplicationController
  def index
    start_position = params[:start_position].to_i || 0
    render locals: {start_position: start_position}
  end

  def configure
  end
end
