# classes are simply a convenient way to organize functions (also called methods): methods are located within the controller


class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def hwlist
    @user = User.find(params[:id])
    @questions = Question.where(user_id: @user.id)
    @assignments = Assignment.all
  end

  # GET /users
  # GET /users.json
  def index
    
    @assignments = Assignment.all 
    @users = User.where(admin: false)

    @user = current_user
    @evaluations = Evaluation.where(user_id: @user.id)
    @current_group = @user.group
    @questions = Question.where(user_id: @user.id).order('assignment_id')
    @ratings = Rating.where(user_id: @user.id)
  end

  def change

    @user = current_user
    
    current_group = @user.group

    if current_group.id == 1
      @user.group = Group.find(2)
    else
      @user.group = Group.find(1)
    end

    @user.save

    current_user.group.reload

    redirect_to :back
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User updated. [Applauds]!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User destroyed. You monster!' }
      format.json { head :no_content }
    end
  end

#   def is_writer
#    if current_user.group.writer?
#      puts "writer"
#    else
#      puts "promoter"
#    end
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require[:user].permit[:name, :email, :group_id] 
    end
end
