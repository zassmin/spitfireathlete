class CommentsController < ApplicationController
  before_filter :load_commentable 

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable, notice: "Comment created." and return
    else
      render :new and return
    end
  end

private
  def load_commentable
     klass = [User, Exercise].detect { |c| params["#{c.name.underscore}_id"] }
     @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
