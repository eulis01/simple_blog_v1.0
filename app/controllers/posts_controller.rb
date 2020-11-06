class PostsController < ApplicationController
  
  # adding Full C.R.U.D funcionality
  get "/posts" do
    if logged_in?
      @posts = Post.all.order(created_at: :desc)
      erb :"/posts/index"
    else
      flash[:error] = "Login To See All Posts!"
      redirect_if_not_logged_in
    end
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
    redirect_if_not_logged_in
    @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description] )
    # Shuvle the Post into the current_user.id
    current_user.posts << @post
    # Verifies if the input provided is acceptable and saves validation.
    if @post.save
      flash[:message] = "Great! Your Post is up!" 
      redirect to "/posts/#{ @post.id }"
    else
      flash[:error] = "Couldn't create your Post [#{ @post.errors.full_messages.to_sentence }]"
      redirect to "/posts/new"
    end
  end

  get "/posts/:id" do
    if logged_in?
      @post = Post.find(params[:id])
      erb :"/posts/show"
    else
      flash[:error] = "Please Login to see post"
      redirect_if_not_logged_in
    end
  end

  get "/posts/:id/edit" do
      @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      if authorized_to_edit?(@post)
        erb :"/posts/edit"
      else
        flash[:error] = "Sorry! You Can't Edit This Post!"
        redirect to "/posts"
      end
    else
        redirect_if_not_logged_in
    end
  end

  patch "/posts/:id" do
    if logged_in?
      @post = Post.find(params[:id])
      if authorized_to_edit?(@post)
        @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
        redirect to "/posts/#{ @post.id }"
      else
        erb :failure
      end
    else
      redirect_if_not_logged_in
    end
  end

  delete "/posts/:id" do
    if logged_in?
      @post = Post.find(params[:id])
      if authorized_to_edit?(@post)
        @post.destroy
        redirect to "/posts"
      else
        erb :failure
      end
    else
      redirect_if_not_logged_in
    end
  end
end
