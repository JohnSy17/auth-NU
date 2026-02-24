class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create #add the cookie at the successful path of the create function
    # authenticate the user
    # 1. try to find the user by their unique identifier (email)
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user.nil?
      #4. if the user doesn't exist or they don't know their password -> login fails
      redirect_to "/login"
      flash["notice"] = "Wrong email"
    else 
      if BCrypt::Password.new(@user["password"]) == params["password"]
        cookies["zebra"] = "giraffe" # can deposit a cookie in the cookie har
        session["user_id"] = @user["id"] #encrypts user ID so it is in the session but not saved
        flash["notice"] = "Welcome."
        redirect_to "/companies"
      else 
        redirect_to "/login"
        flash["notice"] = "Wrong password"
      end
    end
    # 3. if they know their password -> login is successful
    # 4. if the user doesn't exist or they don't know their password -> login fails
  end

  def destroy
    # logout the user
    session["user_id"] = nil #sets the session id and then assigns it to nothing
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
