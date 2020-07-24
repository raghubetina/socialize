class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10)

    render("post_templates/index.html.erb")
  end

  def show
    @post = Post.find(params.fetch("id_to_display"))

    render("post_templates/show.html.erb")
  end

  def new_form
    @post = Post.new

    render("post_templates/new_form.html.erb")
  end

  def create_row
    @post = Post.new

    @post.body = params.fetch("body")

    if @post.valid?
      @post.save

      redirect_back(:fallback_location => "/posts", :notice => "Post created successfully.")
    else
      render("post_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @post = Post.find(params.fetch("prefill_with_id"))

    render("post_templates/edit_form.html.erb")
  end

  def update_row
    @post = Post.find(params.fetch("id_to_modify"))

    @post.body = params.fetch("body")

    if @post.valid?
      @post.save

      redirect_to("/posts/#{@post.id}", :notice => "Post updated successfully.")
    else
      render("post_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @post = Post.find(params.fetch("id_to_remove"))

    @post.destroy

    redirect_to("/posts", :notice => "Post deleted successfully.")
  end
end
