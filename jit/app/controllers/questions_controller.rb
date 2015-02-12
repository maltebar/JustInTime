class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def commentlist
    @question = Question.find(params[:question])
    @ratings = Rating.where(question_id: @question.id)
    @assignment = Assignment.find(Assignment.where(id: @question.assignment_id))
  end

  def index
    @user = current_user
    @questions = Question.all
    @assignments = Assignment.all
    @rating = Rating.new
    if Assignment.exists?(active: true)
      @assignment = Assignment.find(Assignment.where(active: true))
      @promoterquestions = Question.where(assignment_id: @assignment.id)
      if @assignment.questions.exists?(user_id: current_user.id) 
        @question = Question.find(@assignment.questions.where(:user_id => current_user.id))
      else 
        if @user.group.writer?
          @question = Question.create(user_id: current_user.id, assignment_id: @assignment.id)
        end
      end
    end
  end


  def show
    @question = Question.find(Question.where(:user_id => current_user.id))
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
    redirect_to questions_path
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
      params.require(:question).permit(:content, :user_id, :user_name, :assignment_id, :votes, :percentage) 
    end
end
