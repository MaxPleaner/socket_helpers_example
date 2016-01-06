class HtmlPagesController < ApplicationController
  
  def todos
  end

  def root
  end

  def notepad
    @notepad = Notepad.find_or_initialize_by(name: params[:name])
    @notepad.save
  end

  private
    def login_required
      redirect_to "http://#{RootUrl}" unless session["current_user"]
    end
end
