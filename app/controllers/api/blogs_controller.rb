class Api::BlogsController < ApplicationController
  before_action :find_all_blogs, only: [:index]
  before_action :set_blog, only: [:show, :user, :update, :destroy]
  before_action :validate_availability_blog, only: [:show, :user, :update, :destroy]
  before_action :must_signed_in, only: [:create, :update, :destroy]
  before_action :must_same_user, only: [:update, :destroy]

  # listing blogs 
  def index 
    json_response(@blogs) 
  end

  # show data blog
  def show 
    json_response(@blog)
  end

  # show user corresponding to blog
  def user
    json_response(@blog.user)
  end

  # add new blog
  def create
    @blog = current_user.blogs.build(blog_params)
    
    if @blog.save 
      json_response(@blog)
    end
  end

  # update attribute blog
  def update 
    if @blog.update_attributes(blog_params)
      json_response(@blog)
    end
  end

  # delete blog
  def destroy 
    if @blog.destroy 
      json_response(@blog)
    end
  end 

  private
  def blog_params
    params.require(:blog).permit(:title, :url)
  end

  def find_all_blogs 
    @blogs = Blog.page(params[:page]) 
  end

  def set_blog 
    @blog = Blog.find_by_id(params[:id])
  end

  def validate_availability_blog 
    error_response(code: 404, message: "Link not found") unless @blog
  end

  def must_signed_in
    non_authenticated_message unless authenticated? 
  end

  def non_authenticated_message 
    error_response code: 401, message: "Sorry, you must signed in."
  end

  def forbidden_message
    error_response code: 403, message: "Sorry, you dont have permission to do this." 
  end

  def must_same_user 
    forbidden_message unless current_user == @blog.user
  end
end
