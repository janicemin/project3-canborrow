class ProfilesController < ApplicationController

	def index
		@users = User.all
		@profiles = Profile.all
		@profile = Profile.find(current_user.id)
		@garment = Garment.new
	end

	def show
		@profile = Profile.find(params[:id])
		@closet = @profile.closet
		@garment = Garment.new
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		if @profile.save
			redirect_to @profile
		else
			render :new
		end
	end

	def edit
		@user = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			redirect_to @profile
		else 
			render :edit
		end
	end

	def destroy
		@profile = Profile.find(params[:id])
		@profile.destroy
		redirect_to @profile
	end

	private

	def profile_params
		params.require(:profile).permit(:name, :gender, :top_size, :bottom_size, :location)
	end

end