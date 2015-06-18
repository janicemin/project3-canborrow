class BorrowsController < ApplicationController

	def index
		@borrows = Borrow.all
	end

	def show
		@borrow = Borrow.find(params[:id])
	end

	def new
		@borrow = Borrow.new
	end

	def create
		@profile = Profile.find(current_user.id)
		@borrow = @profile.borrows.new(borrow_params)
		if @borrow.save
			redirect_to borrows_url(@profile)
		else
			render :new
		end
	end

	def edit
		@borrow = Borrow.find(params[:id])
	end

	def update
		@borrow = Borrow.find(params[:id])
		if @borrow.update(borrow_params)
			redirect_to borrows_url
		else
			render :new
		end
	end

	def destroy
		@borrow = Borrow.find(params[:id])
		@borrow.destroy
		redirect_to borrows_url
	end


	private
	def borrow_params
	 params.require(:borrow).permit(:garment_id)
	end

end