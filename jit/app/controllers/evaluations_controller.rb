class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index
    @evaluations = Evaluation.all
    respond_with(@evaluations)
  end

  def show
    respond_with(@evaluation)
  end

  def new
    @evaluation = Evaluation.new
    respond_with(@evaluation)
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    @assignment = Assignment.find(Assignment.where(active: true))
    @questions = Question.where(assignment_id: @assignment.id, description_flag: @evaluation.description_flag)
    if @evaluation.description_flag == 1
      percent = @assignment.percent_1
    elsif @evaluation.description_flag == 2
      percent = @assignment.percent_2
    elsif @evaluation.description_flag == 3
      percent = @assignment.percent_3
    end
    @evaluation.questions << @questions.sample(@questions.count * percent / 100)
    respond_with(@evaluation)
  end

  def update
    @evaluation.update(evaluation_params)
    respond_with(@evaluation)
  end

  def destroy
    @evaluation.destroy
    respond_with(@evaluation)
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:user_id, :assignment_id, :description_flag) 
    end
end
