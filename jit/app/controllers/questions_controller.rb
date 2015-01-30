class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # this block was giving me problems, so I commented it out for now...
  def index
    #this will give admin a view of all the questions
    #this needs to be updated
#    if current_user.admin?
      @questions = Question.all
      @user = current_user
      @question = Question.find(1)
#    else
#      @questions = Question.where(:user_id => current_user.id)
#    end
#    respond_with(@questions)
  end


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
    @post.user_id = current_user.id #?
    @post.user_name = current_user.name #?
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
