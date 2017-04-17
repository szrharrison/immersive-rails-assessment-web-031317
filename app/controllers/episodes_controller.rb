class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update]

  def index
    @episodes = Episode.all
  end

  def show
    @guests = Guest.all
  end

  private

  def set_episode
    @episode = Episode.find( params[:id] )
  end

  def episode_params
    params.require( :episode ).permit( :date, :number )
  end
end
