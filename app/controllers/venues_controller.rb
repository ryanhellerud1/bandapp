class VenuesController < ApplicationController
def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
    
  end

  def create
    Venue.create(params.require(:venue).permit(:name, :address, :date, :compensation, :typeofmusic))
    redirect_to venues_path
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(params.require(:venue).permit(:name, :address, :date, :compensation, :typeofmusic))
      redirect_to venues_path
    else
      render 'edit'
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was removed!'
    end
  end
