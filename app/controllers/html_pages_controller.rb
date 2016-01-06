class HtmlPagesController < ApplicationController
  def todos
    redirect_to "http://socket-helpers-example.herokuapp.com" unless session["current_user"]
  end
end
