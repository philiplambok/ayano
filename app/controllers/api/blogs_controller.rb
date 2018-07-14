class Api::BlogsController < ApplicationController
  before_action :find_all_blogs, only: [:index]
  before_action :set_blog, only: [:show, :user]
  before_action :validate_availability_user, only: [:show, :user]
  before_action :must_signed_in, only: [:create]

  def index 
    json_response(@blogs) 
  end

  def show 
    json_response(@blog)
  end

  def user
    json_response(@blog.user)
  end

  def create
    @blog = current_user.blogs.build blog_params 
    
    if @blog.save 
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

  def validate_availability_user 
    error_response(code: 404, message: "Link not found") unless @blog
  end

  def must_signed_in
    error_response code: 401, message: "Sorry, you must signed in." unless authenticated? 
  end
end
