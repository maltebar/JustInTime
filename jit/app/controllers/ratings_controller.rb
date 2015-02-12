class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index
    @ratings = Rating.all
    @questions = Question.all
    respond_with(@ratings)
  end

  def show
    #@ratings = Rating.all
    #respond_with(@rating)
    redirect_to questions_path
  end

  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def edit
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.save
    if @rating.discuss?
      @question = Question.find(Question.where(id: @rating.question_id))
      @question.update(votes: @question.votes += 1)
    end 
    respond_with(@rating)
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
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
      params.require(:rating).permit(:discuss, :user_id, :question_id, :comment)
    end
end
