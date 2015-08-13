class ArticlesController < ApplicationController

def index
  @user = User.find(session[:user_id])
  @article = @user.articles
end
  
def show
  @user = User.find(session[:user_id])
  @article = @user.articles.find(params[:id])
end

def edit
  @user = User.find(session[:user_id])
  @article = @user.articles.find(params[:id])
end

def new
  @article = Article.new
end
 
def create
  user = User.find(session[:user_id])   
  @article = user.articles.create(article_params)
 
  if @article.save
    redirect_to user_article_path(:user_id => user.id,:id => @article.id)
  else
    render 'new'
  end 
end

def update
  @user = User.find(session[:user_id])   
  @article = @user.articles.find(params[:id])

  if @article.update(article_params)
    redirect_to user_article_path(:user_id => @user.id,:id => @article.id)
  else
    render 'edit'
  end
end

def destroy
  @user = User.find(session[:user_id])   
  @article = @user.articles.find(params[:id])
  
  @article.destroy
  redirect_to user_articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end