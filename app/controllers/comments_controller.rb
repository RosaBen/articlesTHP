class CommentsController < ApplicationController
    before_action :authenticate_user!
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article, notice: "Commentaire ajouté."
    else
      redirect_to @article, alert: "Impossible d’ajouter le commentaire."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: "Commentaire mis à jour."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @article, notice: "Commentaire supprimé."
  end


  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def authorize_user!
    redirect_to @article, alert: "Not authorized" unless @comment.user === current_user
  end

    def comment_params
    params.require(:comment).permit(:content)
  end
end
