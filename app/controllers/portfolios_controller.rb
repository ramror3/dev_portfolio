class PortfoliosController < ApplicationController

	def index
		@portfolio_items = Portfolio.all
		# @portfolio_items = Portfolio.portfolio_items
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		# binding.pry
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

		respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio item was successfully created.' }
        # format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        # format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])
		
		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
				format.html { redirect_to portfolios_path, notice: 'portfolio item was successfully created.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@portfolio_item = Portfolio.find(params[:id])
		@portfolio_item.destroy

		respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio item was successfully created.' }
        # format.json { render :show, status: :created, location: @portfolio_item }
      end
    end
	end
end