class UsersController < ApplicationController
  # Creating a new User 
  get "/signup" do
    erb :"/users/new.html"
  end

  # POST: /signup
  post "/signup" do
    # Checking if there are any blank fields
    if params[:user].values.any? { |v|v.blank?}
      redirect "/signup"
      # Checking that the Username is Available
    elsif User.find_by(username: params[:user][:username])
      redirect "/login"
    else
      # Create a New User
      @user = User.create(params[:user])
      # Log User in,  and verified the session hash mached the user_id
      session[:user_id] = @user.id
      redirect "/users"
    end
  end

  # GET: /users
  get "/users" do
    @user = current_user
    erb :"/users/show.html"
  end
  
  get "/logout" do
    session.clear
    redirect "/"
  end

  # GET: /users/login
  get "/users/login" do
    erb :"/users/login.html"
  end

  # POST: /login
  post "/login" do
    #  Does the User has a Valid username?
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      # User succesifully Log in!!.
      session[:user_id] = user.id

    redirect "/users"
    else
      redirect 
      "/login"
    end
  end

  get "/logout" do
    session.destroy
    redirect "/"
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by(id: params[:id])
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
