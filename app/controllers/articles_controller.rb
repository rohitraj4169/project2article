class ArticlesController < ApplicationController
	before_action :find_params_by_id, only:[:show,:edit,:update,:destroy]
	def index
		@article=Article.all
	end
	def show

	end
	def new
		@article=Article.new
	end
	def create
		@article=Article.new(params_article_require)
		if @article.save
			flash[:notice]="Article  Created Successfully"
			redirect_to @article
		else
			render 'new'
		end
	end
	def edit
	end
	def update
		if @article.update(params_article_require)
			flash[:notice]="Article  Updated Successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end



	private
	 def find_params_by_id
	 	@article=Article.find(params[:id])
	 end

	 def params_article_require
	 	params.require(:article).permit(:title,:description)
	 end



end
