class AppearancesController < ApplicationController

  def create
    @appearance = Appearance.new( appearance_params )
    @guest = Guest.find( params.require( :appearance ).require( :guest_id ) )
    if @appearance.save
      redirect_to guest_path( @guest )
    else
      render "/guests/show"
    end
  end

  private

  def set_appearance
    @appearance = Appearance.find( params[:id] )
  end

  def appearance_params
    params.require( :appearance ).permit( :guest_id, :episode_id )
  end
end
