class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :get_user

  # GET /categories or /categories.json
  def index
    @categories = Category.all

  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user = @user
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    authorize @category
    respond_to do |format|
      
      if @category.update(category_params)
        format.html { redirect_to category_path(@user), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    authorize @category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path(@user), notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      # params.require(:category).permit(:type_category)
      params.require(:category).permit(:type_category,  product: [:price, :title, :description] )
    end

    def get_user
      @user = current_user

    end

    def products_by_category
      @category = Category.find(params[:id])
      @page_title = @category.name
      @products = Category.products.find(:all)
    end

    

end
