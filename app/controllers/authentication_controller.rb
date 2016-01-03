class AuthenticationController < ApplicationController
  def root
  end
  def authenticate
    user = User.find_by(name: params[:name])
    if user && BCrypt::Password.new(user.password).is_password?(params[:password])
      session["current_user"] = user.id
      websocket_response(user, "create")
      render text: ""
      return false
      render json: Oj.dump(["invalid password"]), status: 500
      retrun false
    elsif user
      render json: Oj.dump([""]), status: 500
      return false
    else
      user = User.create(
        name: params[:name],
        password: BCrypt::Password.create(params[:password])
      )
    end
  end
  def logout
    user = User.find(params[:id])
    session.delete("current_user")
    websocket_response(user, "destroy")
    render text: ""
    return false
  end
end
