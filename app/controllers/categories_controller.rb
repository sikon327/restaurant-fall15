class CategoriesController < ApplicationController
	def index
		@category = Category.all
	end

	def new
		@category = Category.new
	end

	def update
		category_params[:category][:restaurant_ids] ||= []
		if @category.update(category_params)
			redirect_to categories_path
		else
			render :edit
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render :new
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def restaurant_params
		params.require(:category).permit(
			:id, :name, { restaurant_ids: [] }
		)
	end
end
