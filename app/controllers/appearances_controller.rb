class AppearancesController < ApplicationController
  def create
    @appearance = Appearance.new( appearance_params )
    @guest = Guest.find( params.require( :appearance ).require( :guest_id ) )
    @episode = Episode.find( params.require( :appearance ).require( :episode_id ) )
    @episodes = Episode.all
    if @appearance.save
      redirect_to episode_path( @episode )
    else
      render 'guests/show'
    end

  end

  private

  def set_appearance
    @appearance = Appearance.find( params[:id] )
  end

  def appearance_params
    params.require( :appearance ).permit( :guest_id, :episode_id, :rating )
  end
end
