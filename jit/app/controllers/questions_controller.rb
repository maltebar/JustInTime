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

      if !@user.group.writer?
        if @assignment.promoter_due > Time.now && Time.now > @assignment.writer_due
          if @assignment.reveal_1?
            if Evaluation.exists?(user_id: @user.id, assignment_id: @assignment.id, description_flag: 1)
              @evaluation_1 = Evaluation.find(Evaluation.where(user_id: @user.id, assignment_id: @assignment.id, description_flag: 1))
            else
              @evaluation_1 = Evaluation.create(user_id: @user.id, assignment_id: @assignment.id, description_flag: 1)
            end
          end
          if @assignment.reveal_2?
            if Evaluation.exists?(user_id: @user.id, assignment_id: @assignment.id, description_flag: 2)
              @evaluation_2 = Evaluation.find(Evaluation.where(user_id: @user.id, assignment_id: @assignment.id, description_flag: 2))
            else
              @evaluation_2 = Evaluation.create(user_id: @user.id, assignment_id: @assignment.id, description_flag: 2)
            end
          end
          if @assignment.reveal_3?
            if Evaluation.exists?(user_id: @user.id, assignment_id: @assignment.id, description_flag: 3)
              @evaluation_3 = Evaluation.find(Evaluation.where(user_id: @user.id, assignment_id: @assignment.id, description_flag: 3))
            else
              @evaluation_3 = Evaluation.create(user_id: @user.id, assignment_id: @assignment.id, description_flag: 3)
            end
          end
        end
      end

      if @user.group.writer?
        if @assignment.questions.exists?(user_id: current_user.id, description_flag: "1")
          @question_1 = Question.find(@assignment.questions.where(user_id: current_user.id, description_flag: "1"))
        else
          if @assignment.description != "" && @assignment.writer_due > Time.now 
            @question_1 = Question.create(user_id: current_user.id, assignment_id: @assignment.id, description_flag: "1")
          end
        end

        if @assignment.questions.exists?(user_id: current_user.id, description_flag: "2")
          @question_2 = Question.find(@assignment.questions.where(user_id: current_user.id, description_flag: "2"))
        else
          if @assignment.description_2 != "" && @assignment.writer_due > Time.now 
            @question_2 = Question.create(user_id: current_user.id, assignment_id: @assignment.id, description_flag: "2")
          end
        end

        if @assignment.questions.exists?(user_id: current_user.id, description_flag: "3")
          @question_3 = Question.find(@assignment.questions.where(user_id: current_user.id, description_flag: "3"))
        else
          if @assignment.description_3 != "" && @assignment.writer_due > Time.now 
            @question_3 = Question.create(user_id: current_user.id, assignment_id: @assignment.id, description_flag: "3")
          end
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
      params.require(:question).permit(:content, :user_id, :user_name, :assignment_id, :votes, :percentage, :description_flag, :evaluation_id) 
    end
end
