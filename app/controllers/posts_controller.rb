class PostsController < ApplicationController

  # adding Full C.R.U.D funcionality

  # Getting all the post data from the DB.
  get "/posts" do
    @posts = Post.all.order(created_at: :desc)
    erb :"/posts/index"
  end

  # Allow the user to Create a new Post if logged in.
  get "/posts/new" do
    if logged_in?
      erb :"/posts/new"
    else
      flash[:error] = "Login to create a Post!"
      redirect_if_not_logged_in
    end
  end

  # POST: /posts
  post "/posts" do
    redirect "/posts"
  end

  # GET: /posts/5
  get "/posts/:id" do
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    redirect "/posts/:id"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    redirect "/posts"
  end
end
