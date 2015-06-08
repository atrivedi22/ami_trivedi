class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @listing= Listing.new

  end

  def new
    @city = City.new
  end

  def create
    @city = City.new
    @city.city = params[:city]

    if @city.save
      redirect_to "/cities", :notice => "City created successfully."
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    @city.city = params[:city]

    if @city.save
      redirect_to "/cities", :notice => "City updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    redirect_to "/cities", :notice => "City deleted."
  end
end
