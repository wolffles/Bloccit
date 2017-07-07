class AdvertismentsController < ApplicationController
  def index
    @advertisments = Advertisment.all
  end

  def show
    @advertisment = Advertisment.find(params[:id])
  end

  def new
    @advertisment = Advertisment.new
  end

  def create
    @advertisment = Advertisment.new
    @advertisment.title = params[:advertisment][:title]
    @advertisment.price = params[:advertisment][:price]
    @advertisment.copy = params[:advertisment][:copy]

    if @advertisment.save
      flash[:notice] = "Post was saved."
      redirect_to @advertisment
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
