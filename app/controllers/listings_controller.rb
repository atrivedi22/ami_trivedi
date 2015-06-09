class ListingsController < ApplicationController
  def index
    # @listings = Listing.all
    @city_id = params[:city_id]
    @listings = Listing.where(city_id: @city_id)
  end

  def show
    @listing = Listing.find(params[:id])

  end

  def new
    @listing = Listing.new

  end

  def create
    @listing = Listing.new
    @listing.summary = params[:summary]
    @listing.address = params[:address]
    @listing.price = params[:price]
    @listing.rented = params[:rented]
    @listing.city_id = params[:city_id]
    @listing.listing_id =params[:listing_id]
    @listing.user_id = params[:user_id]

    if @listing.save
      redirect_to :back, :notice => "Listing created successfully."
    else
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.summary = params[:summary]
    @listing.address = params[:address]
    @listing.price = params[:price]
    @listing.rented = params[:rented]
    @listing.city_id = params[:city_id]
    @listing.user_id = params[:user_id]

    if @listing.save
      redirect_to "/listings", :notice => "Listing updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    redirect_to "/listings", :notice => "Listing deleted."
  end
end
