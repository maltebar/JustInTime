class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ratings = Rating.all
    respond_with(@ratings)
  end

  def show
    @ratings = Rating.all
    
    respond_with(@rating)
  end

  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def edit
  end

  def create
    @rating = Rating.new(rating_params)
    
    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating updated. [Applauds]!' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
    #respond_with(@rating)
  end

  def destroy
    @rating.destroy
    respond_with(@rating)
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params[:rating].permit[:discuss, :user_id, :question_id]
    end
end
