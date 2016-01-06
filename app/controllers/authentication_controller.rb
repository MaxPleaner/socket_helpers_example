class AuthenticationController < ApplicationController
  def root
    session.delete("current_user")
  end
  def authenticate
    user = User.find_by(name: params[:name])
    if user && BCrypt::Password.new(user.password).is_password?(params[:password])
      session["current_user"] = user.id
      render json: Oj.dump([ "OK"]), status: 200
    elsif user
      render json: Oj.dump(["invalid password"]), status: 401
    else
      user = User.create(
        name: params[:name],
        password: BCrypt::Password.create(params[:password])
      )
      session["current_user"] = user.id
      websocket_response(user, "create")
    end
  end
  def logout
    user = User.find(params[:id])
    session.delete("current_user")
    render json: Oj.dump([ "OK"]), status: 200
  end
end
