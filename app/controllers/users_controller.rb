class UsersController < ApplicationController

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          # Alert user that Login has been Accepted.
          flash[:message] = "!!Welcome Login Accepted!!"
          redirect to "/users/#{ @user.id }"
        else
          flash[:error] = "Invalid  Email or Password."
          redirect_if_not_logged_in
        end
  end

  get "/users/:id" do
    if logged_in? && User.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])
      erb :"/users/show"
    else
      redirect_if_not_logged_in
    end
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/users" do
    @user = User.create(params)
    if @user.save
      flash[:message] = "Welcome To SimpleBlog 😃"
    session[:user_id] = @user.id
    redirect to "/users/#{ @user.id }"
    else
      flash[:error] = "[#{ @user.errors.full_messages.to_sentence }]!!"
      redirect to "/"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
  end
end