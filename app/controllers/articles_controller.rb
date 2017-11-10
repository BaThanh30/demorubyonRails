class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh",password: "secret",expext: [:index, :show]
  def index
   @articles = Article.all
 end

  def show
    @article =Article.find(params[:id])

  end

  #new
  def new
    @article = Article.new
  end

  #Edit
  def edit
  @article = Article.find(params[:id])
  end
  #create
  def create
    @article = Article.new(articles_params)

    if @article.save
    redirect_to @article
    else
      render 'new'
    #render plain: params[article].inspect
  end
end

def article_params
  params.require(:article).permit(:title, :body, :text)
end
  #update
  def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
  #delete
  def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
    end

  private
    def articles_params
      params.require(:article).permit(:title, :text)

    end
end
