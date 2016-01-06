class HtmlPagesController < ApplicationController
  
  def todos
  end

  def root
  end

  private
    def login_required
      redirect_to "http://socket-helpers-example.herokuapp.com" unless session["current_user"]
    end
end
