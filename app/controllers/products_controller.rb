class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @ret = []
    @products = Product.all
    @products.each do |p|
      @town = Town.find(p.town_id)
      @user = User.find(p.user_id)
      @city = City.find(@town.city_id)
      @shop = Shop.find(p.shop_id)
      @ret.push(p.as_json.merge(shop_id:@shop.id, shop_name:@shop.name,user_id:@user.id, user_first_name: @user.first_name, user_last_name: @user.last_name, user_email:@user.email, town_id: @town.id, town_name: @town.name, city_id: @city.id, city_name: @city.name))
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @town = Town.find(@product.town_id)
    @user = User.find(@product.user_id)
    @city = City.find(@town.city_id)
    @shop = Shop.find(@product.shop_id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @shop = Shop.where(name: params[:shop_name].to_s).first
    if @shop==nil
      @shop = Shop.create!(town_id: params[:town_id], name:params[:shop_name])
    end
    @product = Product.create!(shop_id: @shop.id,available: params[:available], return_date:params[:return_date],name: params[:name],price: params[:price], town_id: params[:town_id], user_id: @current_user.id)
    respond_to do |format|
      if @product.save
        format.json { render :create, status: :created, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :town_id, :available, :return_date, :shop_name)
    end
end
