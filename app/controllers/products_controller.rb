class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :get_category
  before_action :get_user
  before_action :authenticate_user!, except: [:show, :index]
  # GET /products or /products.json
  def index
    @products = @category.products
  end

  def get_user_products
    @products = current_user.products
  end

  def get_user
    @user = current_user
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find params[:id]
    skip_authorization
  end

  # GET /products/new
  def new
    @product = @category.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = @category.products.build(product_params)
    @product.user = @user
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to category_products_path(@category), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    authorize @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_products_path(@category), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to category_products_path(@category), notice: "Product was successfully destroyed." }
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
      params.require(:product).permit(:price, :title, :description)
    end

    def get_category
      @category = Category.find(params[:category_id])
    end

end
