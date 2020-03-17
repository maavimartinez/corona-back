class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :login]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
    puts "login entre"
    @user = User.where(email: params[:email].to_s.downcase).first()
    if @user && @user.authenticate(params[:password].to_s) 
        auth_token = JsonWebToken.encode({user_id: @user.id})
        render json: {auth_token: auth_token, id: @user.id, status: 200}, status: 200
    else
      render json: {error: 'Email/contraseña incorrectos', status: 422}, status: 422
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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
    @user = User.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email].to_s.downcase, phone: params[:phone], password: params[:password])
    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
    end
end
