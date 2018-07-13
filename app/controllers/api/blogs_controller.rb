class Api::BlogsController < ApplicationController
  before_action :find_all_blogs, only: [:index]
  before_action :set_blog, only: [:show, :user]

  def index 
    json_response(@blogs) 
  end

  def show 
    json_response(@blog)
  end 

  def user 
    json_response(@blog.user)
  end

  private
  def find_all_blogs 
    @blogs = Blog.page(params[:page]) 
  end

  def set_blog 
    @blog = Blog.find_by_id(params[:id])
  end
end
