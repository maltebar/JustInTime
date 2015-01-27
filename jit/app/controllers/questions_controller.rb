class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index
    #this will give admin a view of all the questions
    #the else statment has to be changed
    #in fact, this entire thing may need to be moved to the view files but I'm not sure yet
    if current_user.admin?
      @questions = Question.all
    else
      @questions = Question.where(:user_id=>current_user.id)
    end
    respond_with(@questions)
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
      params.require(:question).permit(:title, :content) #WILL CHANGE EVENTUALLY, BUT TO WHAT?
    end
end
