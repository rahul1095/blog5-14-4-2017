class CommentsController < ApplicationController
	
	def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

  def edit
     @blog = Blog.find(params[:blog_id])
     @comment = Comment.find(params[:id])
  end

 def destroy
    #@article = Article.find(params[:id])
    #@comment = @article.comments.find(params[:article_id])
    @blog = Blog.find(params[:blog_id])
     @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to article_path(@article)
    redirect_to blog_path(@blog)

  end

  def update
     @blog = Blog.find(params[:blog_id])
     @comment = Comment.find(params[:id])
     if @comment.update(comment_params)
      flash[:notice] = "Comment Updated"

   redirect_to blog_path(@blog)
     else
      render 'edit'
   end
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end


