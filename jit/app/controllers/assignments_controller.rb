class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json # for web-service support; on respond_to/with.... http://www.justinweiss.com/blog/2014/11/03/respond-to-without-all-the-pain/

  # re: .html and .json responses... http://stackoverflow.com/questions/20188047/rails-respond-to-json-and-html
  # but what does above/below /do/, in English? 

  def qlist
    @assignment = Assignment.find(params[:assignment])
    @question_flags = []
    for i in 1..3
      @question_flags[i] = @assignment.questions.where(description_flag: i).where.not(content: "").order('percentage desc')
    end

    @questions_flag_1 = @assignment.questions.where(description_flag: 1).where.not(content: "").order('percentage desc')
    @questions_flag_2 = @assignment.questions.where(description_flag: 2).where.not(content: "").order('percentage desc')
    @questions_flag_3 = @assignment.questions.where(description_flag: 3).where.not(content: "").order('percentage desc')
  end


  def index
    @assignments = Assignment.all
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignments = Assignment.where.not(id: @assignment.id)

    flash[:notice] = "Assignment created. [Applause]!" if @assignment.save
    respond_with(@assignment)


    if @assignment.active?
      @assignments.each do |assignment|
        assignment.update(active: false)
      end
      if @assignment.id % 2 == 0
        Group.update(Group.where(name: 'Group 2'), :writer => true)
        Group.update(Group.where(name: 'Group 1'), :writer => false)
      else
        Group.update(Group.where(name: 'Group 2'), :writer => false)
        Group.update(Group.where(name: 'Group 1'), :writer => true)
      end
    end
    
  end

  def update # could this action/method also be shortened to the above format? how/why?
    @assignments = Assignment.where.not(id: @assignment.id)
    respond_to do |format|
      if @assignment.update(assignment_params) #if all went well, assignment now updated
        format.html { redirect_to :action => 'index'}
        format.json { render :show, status: :ok, location: @assignment }
      else # otherwise, assignment not updated: throw error
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end

    if @assignment.active?
      @assignments.each do |assignment|
        assignment.update(active: false)
      end
      if @assignment.id % 2 == 0
        Group.update(Group.where(name: 'Group 2'), :writer => true)
        Group.update(Group.where(name: 'Group 1'), :writer => false)
      else
        Group.update(Group.where(name: 'Group 2'), :writer => false)
        Group.update(Group.where(name: 'Group 1'), :writer => true)
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment destroyed. You monster!' } #doesn't show! why not?
      format.json { head :no_content } 
  end
end

  private 
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:title, :description, :writer_due, :promoter_due, :active, :description_2, :description_3, :reveal_1, :reveal_2, :reveal_3, :percent_1, :percent_2, :percent_3)
    end
end
