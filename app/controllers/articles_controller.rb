class ArticlesController < ApplicationController

before_action :set_article, only: [ :edit, :destroy, :show, :update]

def index
	@articles = Article.all
end

def new
	@article = Article.new
end

def create
	# render plain: params[:article].inspect
	@article = Article.new(article_params)
	if @article.save
	@article.save
		flash[:notice] = "Article was successfully saved"
		redirect_to article_path(@article)
	else
		render :new
	end

end

def destroy
	if @article.destroy
		flash[:notice] = "Article deleted successfully"
		redirect_to articles_path
	else

	end
end

def update
	if @article.update(article_params)
		flash[:notice] = "Article update successful"
		redirect_to article_path(@article)
	else
		render :edit
	end
end

def edit
end

def show
end

private

def set_article
	@article = Article.find(params[:id])

end

def article_params
	params.require(:article).permit(:title, :description)
	
end
end