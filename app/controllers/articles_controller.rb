class ArticlesController < ApplicationController
  before_action :set_action, only:[:show,:edit,:update,:destroy]
  def index
    @articles =Article.all    
  end
  def new
      @article = Article.new
  end

  def create
    #render plain: params[:article].inspect

    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save

      flash[:notice] = "Article Successfully created!"
      redirect_to article_path(@article)
      
    else
      render :new
    end
    #@article.save
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      redirect_to article_path(@article)
    else
      render :edit
    end

    
  end
   
  def destroy
    
  end

  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
    def set_action
      @article = Article.find(params[:id])      
    end
    
end