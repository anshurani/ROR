class WelcomeController < ApplicationController
  def index
  	@article = Article.all
  end
end
