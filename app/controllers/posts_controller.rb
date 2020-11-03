class PostsController < ApplicationController

  # adding Full C.R.U.D funcionality


  get "/posts" do
    @posts = Post.all.order(created_at: :desc)
    erb :"/posts/index"
  end


  get "/posts/new" do
    if logged_in?
      erb :"/posts/new"
    else
      flash[:error] = "Login to create a Post!"
      redirect_if_not_logged_in
    end
  end


  post "/posts" do
    @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    #verifies if the input provided is acceptable and saves validation.
    if @post.save
      flash[:message] = "Great! Your Post is up!" 
    redirect "/posts/#{@post.id}"
    else
      flash[:error] = "Couldn't create your Post [#{@post.errors.full_messages.to_sentence}]"
      redirect "posts/new"
    end
  end


  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end


  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
      if authorized_to_edit?(@post)
      erb :"/posts/edit"
      else
        flash[:error] = "Sorry! You Can't Edit This Post!"
        redirect "/posts"
      end
  end


  patch "/posts/:id" do
    @post = Post.find(params[:id])
    if authorized_to_edit?(@post)
    @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
    redirect "/posts/#{@post.id}"
    else
      erb :failure
    end
  end


  delete "/posts/:id" do
    @post = Post.find(params[:id])
    if authorized_to_edit?(@post)
    @post.destroy
    redirect "/posts"
    else
      erb :failure
    end
  end
end
