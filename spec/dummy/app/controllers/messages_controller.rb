class MessagesController < ApplicationController
  def success_flash
    flash[:success] = 'All goes right'
    respond_to do |format|
      format.js   { head :ok }
      format.html { render :greetings }
    end
  end

  def error_and_warning_flash
    flash[:error]   = 'Oops! Somethig was wrong'
    flash[:warning] = 'There are some issues.'
    respond_to do |format|
      format.js   { head :ok }
      format.html { render :greetings }
    end
  end
end
