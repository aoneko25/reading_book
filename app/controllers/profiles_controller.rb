class ProfilesController < ApplicationController
  before_action :validates_new, only: :create# プロフィールの登録のバリデーション
  
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(
      terget: profile_params[:terget], 
      favorite_book: profile_params[:favorite_book], 
      recommended_book: profile_params[:recommended_book], 
      user_id: current_user.id)
      @profile.save
  end
end

def validates_new
  @profile = Profile.new(
    terget: profile_params[:terget], 
    favorite_book: profile_params[:favorite_book], 
    recommended_book: profile_params[:recommended_book], 
    user_id: current_user.id)
  render '/profiles/new' unless @profile.valid?
end

def edit
  @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])
  if @profile.update(profile_params)
    redirect_to root_path
  else
    render :edit
  end
end

def profile_params
  params.require(:profile).permit(
    :terget, 
    :favorite_book,
    :recommended_book,
    )
  end
