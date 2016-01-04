class HtmlPagesController < ApplicationController
  def todos
    redirect_to "http://localhost:3000" unless session["current_user"]
  end
end
