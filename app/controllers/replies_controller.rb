class RepliesController < ApplicationController
  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])

  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new
    @reply.user_id = params[:user_id]
    @reply.listing_id = params[:listing_id]
    @reply.listing_id.summary = params [:summary]


    if @reply.save
      redirect_to "/replies", :notice => "Reply created successfully."
    else
      render 'new'
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])

    @reply.user_id = params[:user_id]
    @reply.listing_id = params[:listing_id]

    if @reply.save
      redirect_to "/replies", :notice => "Reply updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @reply = Reply.find(params[:id])

    @reply.destroy

    redirect_to "/replies", :notice => "Reply deleted."
  end
end
