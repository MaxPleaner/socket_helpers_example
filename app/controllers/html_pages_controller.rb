class HtmlPagesController < ApplicationController
  
  before_action :login_required, except: [:todos]

  def todos
  end

  def root
  end

  def locations
    @init_locations = Oj.dump(
      Location.all.includes(:categories).map do |location|
        location.attributes.merge(
          'record_class' => "location"
        )
      end
    )
    @init_categories = Oj.dump(
      LocationCategorization.select(:category).distinct.to_a.map(&:attributes)
    )
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
    WebsocketRails["notepad"].trigger("create", public_attrs(@notepad))

  end

  private
    def login_required
      redirect_to "http://#{RootUrl}/unauthenticated" unless session["current_user"]
    end
end
