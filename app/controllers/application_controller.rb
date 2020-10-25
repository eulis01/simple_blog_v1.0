require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrect, "simple_blog_secrect"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  not_found do 
    status 404
    erb :failure
  end

  helpers do

    def logged_in?
    !!current_user
    end

    #abstract this
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(post)
      post.user == current_user
    end
  end
end
