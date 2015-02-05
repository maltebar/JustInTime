class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  #THIS WHOLE METHOD NEEDS TO BE FIXED URGENTLY!
  def index
#    if current_user.admin?
      @questions = Question.all
      @user = current_user
    
#    elses
#      @questions = Question.where(:user_id => current_user.id)
#    end
#    respond_with(@questions)
  end

# To do...
  # 1. need to deal with case where user hasn't written question yet... i.e. if question nil
  # 2. figure out multiple HW assignments: question model can account for that, i.e. question belongs_to assignment)


  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content, :user_id, :user_name) 
    end
end
