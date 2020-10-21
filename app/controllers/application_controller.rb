require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrect, ENV['SESSION_SECRECT']
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user 
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def is_authorized?(record, path)
      unless record.user == current_user
      redirect path
      end
    end

    def logged_in?
    !!current_user
    end
  end
end
