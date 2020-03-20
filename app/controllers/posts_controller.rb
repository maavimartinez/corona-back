class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @ret = []
    @posts = Post.all
    @posts.each do |p|
      @town = Town.find(p.town_id)
      @user = User.find(p.user_id)
      @city = City.find(@town.city_id)
      @ret.push(p.as_json.merge(user_phone:@user.phone, user_id:@user.id, user_first_name: @user.first_name, user_last_name: @user.last_name, user_email:@user.email, town_id: @town.id, town_name: @town.name, city_id: @city.id, city_name: @city.name))
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @town = Town.find(@post.town_id)
    @user = User.find(@post.user_id)
    @city = City.find(@town.city_id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @previous_post = Post.where(user_id: @current_user.id).first
    puts params[:offering]
    if @previous_post != nil &&(@previous_post.offering == params[:offering])
      render :json => {:error => "No pudes ingresar otro pedido/voluntario"}.to_json, :status => 422
    else
      @post = Post.create!(offering:params[:offering], description: params[:description],title: params[:title], town_id: params[:town_id], user_id: @current_user.id)
      @town = Town.find(params[:town_id])
      @city = City.find(@town.city_id)
      respond_to do |format|
        if @post.save
          format.json { render :create, status: :created, location: @post }
        else
         format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.json { render :delete, status: 200 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :town_id, :title, :offering)
    end
end
