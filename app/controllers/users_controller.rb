class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow_user, :grade_user,:post_grade, :edit, :update, :destroy]

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def show
  end

  def find_file
    query = params[:query].downcase
    @users = User.where('lower(name) LIKE ? OR lower("lastName") LIKE ? OR lower("linkedin") LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
    render json: @users.to_json(only: [:id, :name, :lastName, :linkedin])
  end

  def notification
  end

  def grade_user
  end

  def post_grade
    if @user.retire?
      application = current_user.applications.where(retire_id: @user.retire.id).first
      evaluation = application.evaluation
      evaluation.value = params[:grade]
      evaluation.save
    end
    redirect_to current_user
  end

  def toggle_notification
    application = Application.find_by(params[:application_id])
    if application
      if current_user.retire?
        if current_user.retire.applications.where(id: application.id).count > 0
          application.is_valid = !application.is_valid
          application.save
        end
      end
    end
    redirect_to current_user
  end

  def follow_user
    if @user.retire?
      application =   Application.create!(
                        user_id: current_user.id,
                        retire_id: @user.retire.id,
                        is_valid: false,
                        read: false
                      )
     Evaluation.create!(
        user_id: @user.id,
        application_id: application.id,
        value: 0
     )
    end
    redirect_to :back
  end

  def unfollow_user
    application = Application.find_by(params[:application_id])
    application.evaluation.destroy
    application.destroy

    redirect_to current_user
  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario fue creado con Exito' }
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
        format.html { redirect_to @user, notice: 'Usuario fue actualizado con Exito' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :sex, :birthday, :city, :commune, :state, :linkedin,:email,:password,:password_confirmation)
    end
end
