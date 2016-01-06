class HtmlPagesController < ApplicationController
  
  before_action :login_required

  def todos
  end

  def root
  end

  def show_user
    @user = User.find_by(id: params[:id])
    @chat = Chat.find_by(sender: @current_user, receiver: @user)
    @chat ||= Chat.find_by(receiver: @current_user, sender: @user)
    @chat ||= Chat.create(sender: @current_user, receiver: @user)
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
