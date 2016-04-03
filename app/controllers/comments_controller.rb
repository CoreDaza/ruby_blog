class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "eli", password: "eli", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  # ==== Examples
  #
  #   Person.exists?(5)
  #   Person.exists?('5')
  #   Person.exists?(name: "David")
  #   Person.exists?(['name LIKE ?', "%#{query}%"])
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)

  end
  
  # Returns true if the collection is empty.
  #
  # If the collection has been loaded
  # it is equivalent to <tt>collection.size.zero?</tt>. If the
  # collection has not been loaded, it is equivalent to
  # <tt>collection.exists?</tt>. If the collection has not already been
  # loaded and you are going to fetch the records anyway it is better to
  # check <tt>collection.length.zero?</tt>.
  def empty?
    if loaded?
      size.zero?
    else
      @target.blank? && !scope.exists?
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end