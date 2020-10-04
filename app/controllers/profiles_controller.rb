class ProfilesController < ApplicationController
  def index
    @profiles = Profile.new
  end

  def create
    Profile.create(
      self_introduction: profiles_params[:self_introduction], 
      dream: profiles_params[:dream], 
      terget: profiles_params[:terget], 
      scheduled_date: profiles_params[:scheduled_date], 
      plan: profiles_params[:plan], 
      favorite_book: profiles_params[:favorite_book], 
      hobby: profiles_params[:hobby], 
      forte: profiles_params[:forte], 
      weak_point: profiles_params[:weak_point], 
      user_id: current_user.id)
  end
end

def profiles_params
  params.require(:profile).permit(
    :self_introduction,
    :dream,
    :terget, 
    :scheduled_date, 
    :plan,
    :favorite_book,
    :hobby,
    :forte,
    :weak_point,
    )
  end
