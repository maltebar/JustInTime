class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  #THIS WHOLE METHOD NEEDS TO BE FIXED URGENTLY!
  def index

    @questions = Question.all
    @user = current_user
    @assignment = Assignment.find(Assignment.where(active: true))
    @assignments = Assignment.all
    @question = Question.find(Question.where(:user_id => current_user.id))
  end

  #semi-fixed!!!!!!!!! NEEDS URGENT WORK!!!!!
  def show
    @question = @question = Question.find(Question.where(:user_id => current_user.id))
    @assignment = Assignment.find(Assignment.where(active: true))
    @questions = Question.where(assignment_id: @assignment.id)
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
      params.require(:question).permit(:content, :user_id, :user_name, :assignment_id) 
    end
end
