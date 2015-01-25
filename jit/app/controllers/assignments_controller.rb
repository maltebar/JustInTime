class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @assignments = Assignment.all
    respond_with(@assignments)
  end

  def show
    respond_with(@assignment)
  end

  def new
    @assignment = Assignment.new
    respond_with(@assignment)
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)
    
    respond_to do |format|
      if @assignment.save #if all went well, assignment now saved
        format.html { redirect_to @assignment, notice: 'Assignment created. Well done!' } #where are Edit | Back buttons manipulated on this page?
        format.json { render :show, status: :created, location: @assignment }
      else  #otherwise, assignment not saved: throw error
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assignment.update(assignment_params) #if all went well, assignment now updated
        format.html { redirect_to @assignment, notice: 'Assignment updated. Well done!' }
        format.json { render :show, status: :ok, location: @assignment }
      else #otherwise, assignment not updated: throw error
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment destroyed. You monster.' }
      format.json { head :no_content }
  end
end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:title, :description, :writer_due, :promoter_due) #added last two parameters; any others?
    end
end
