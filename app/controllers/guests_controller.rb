class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update]

  def index
    @guests = Guest.all
  end

  def show
    @episodes = Episode.all
  end

  private

  def set_guest
    @guest = Guest.find( params[:id] )
  end

  def guest_params
    params.require( :guest ).permit( :name, :occupation )
  end
end
