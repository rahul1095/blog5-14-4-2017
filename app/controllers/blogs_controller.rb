class BlogsController < ApplicationController
	before_action :authenticate_user!

	def index
    if params[:search].present?
      @blogs= Blog.where('title LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
     elsif params[:start_date].present? && params[:end_date].present?
      @blogs = Blog.where('created_at >= ? AND created_at <= ?', params[:start_date].to_date, params[:end_date].to_date)  
     else
      @blogs=Blog.all
    end
 end
  def new
    @blog=Blog.new
	end
 
	def create

    @blog = Blog.new(blog_params) 
    @blog.save
    #params[:blog][:image].each do |image|
        #Image.create(:image=> image, blog_id: @blog.id)

    #end
    flash[:notice] = "new blog is created"
    redirect_to @blog
  end

  def show
    @blog = Blog.find(params[:id])
  end


  def edit

   @blog=Blog.find(params[:id])

  end

  def update
    @blog=Blog.find(params[:id])
    @blog.update(blog_params)
  #   if params[:blog][:image].present?
  #   images = @blog.images
  #    images.destroy_all

  #   params[:blog][:image].each do |image|
  #     Image.create(:image=> image, blog_id: @blog.id)
  #   end
  # end
    flash[:notice] = "Successfully updated"
    redirect_to blogs_path
  end
	def destroy
    @blog=Blog.find(params[:id])
    @blog.destroy
    
    flash[:notice] = "Successfully deleted"
    redirect_to blogs_path
  end
  
  
	private
  def blog_params
    params.require(:blog).permit(:title, :description, :image, :vedio, :category_id,:document,images_attributes: [:id, :image, :_destroy])
  end
end


