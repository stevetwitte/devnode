class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update, :destroy]

	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @profile.update(profile_params)
				format.html { redirect_to @profile, notice; 'Profile was successfully updated.' }
				format.json { render :show, status: :ok, location: @profile }
			else
				format.html { render :edit }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@profile.destroy
		respond_to do |format|
			format.html { redirect_to root_path, notice; 'Profile was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

		def set_profile
			@profile = Profile.find(params[:id])
		end

		def profile_params
			params.require(:profile).permit(:name, :image, :github, :website)
		end

end
