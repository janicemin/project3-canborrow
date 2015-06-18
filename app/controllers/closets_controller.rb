class ClosetsController < ApplicationController
	def index
		@closets = Closet.all
	end

	def show
		@closet = Closet.find(params[:id])
	end

	def new
		@closet = Closet.new
	end

	def create
		@closet = Closet.new(closet_params)
		if @closet.save
			redirect_to profile_path(@closet.profile)
		else
			render :new
		end
	end

	def edit
		@closet = Closet.find(params[:id])
	end

	def update
		# params[:profile_id]
		# closet_params.garment_id
		@closet = Closet.find(params[:id])

		if defined?(params[:closet][:garment_id])
			@garment = Garment.find(params[:closet][:garment_id]);
# Uncomment this for sanity check that the update is working this line:
#			@garment.closet_id = 2;
			@garment.closet_id = params[:id]
			if @garment.save
				render :text => TRUE
			else 
				render :text => FALSE
			end

			return
		end

render :text => params.inspect
		#render :text => params.inspect
return
		if @closet.update(closet_params)
			redirect_to profile_path(@closet.profile)
		else
			render :new
		end

		# Due to having too many 1-1 associations, to reduce the number of required model updates,
		# we're temporarily making this a toggle. If the record exists then delete it, otherwise create it.
		if defined?(closet_params.garment_id)
			if Borrow.exists?([profile_id: params[:id], garment_id: closet_params.garment_id])
				Borrow.delete([profile_id: params[:id], garment_id: closet_params.garment_id])
			else
				@borrow = Borrow.new({ profile_id: params[:id], garment_id: closet_params.garment_id }).save();
			end
		end

		if !request.xhr?
			return
		end
	end

	def destroy
		@closet = Closet.find(params[:id])
		@closet.destroy
		redirect_to profile_path
	end

	private
	def closet_params
		params.require(:closet).permit(:name, :profile_id)
	end

end