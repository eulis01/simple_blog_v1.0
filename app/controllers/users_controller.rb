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

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
