class UsersController < ApplicationController

  # GET: /login (render) the Login Form
  get "/login" do
    erb :"/users/login"
  end

  # POST: /login Receives the data from the Login form.
  post "/login" do
    @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          # Alert user that Login has been Accepted.
          flash[:message] = "!!Welcome Login Accepted!!"
          redirect to "/users/#{@user.id}"
        else
          flash[:error] = "Invalid  Email or Password."
          redirect_if_not_logged_in
        end

  end

  # show the user's route
  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    erb :"/users/show"
  end

  # show the signup route
  get "/signup" do
    erb :"/users/signup"
  end

  # route to create user and post user and add key/value pairs.
  post "/users" do
    @user = User.create(params)
    session[:user_id] = @user.id
    # show the user profile page
    redirect "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
