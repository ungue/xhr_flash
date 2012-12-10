class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_with_success_flash
    flash[:success] = 'All goes right'
    head :ok
  end
end
