class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def json_url
    @items = Item.all.with_attached_image
    render json: @items.map { |item|
      @categories = Category.where(id: CategoryItem.where(item_id: item.id).select('category_id'))
      @animals = Animal.where(id: AnimalItem.where(item_id: item.id).select('animal_id'))
      @sizes = Size.where(id: SizeItem.where(item_id: item.id).select('size_id'))
      item.as_json.merge({ image: url_for(item.image), 
      categories: @categories, animals: @animals, sizes: @sizes})  
    }
  end

  # GET /items/new
  def new
    @item = Item.new
    @categories = Category.all
    @animals = Animal.all
    @sizes = Size.all
  end

  # GET /items/1/edit
  def edit
    @categories = Category.all
    @animals = Animal.all
    @sizes = Size.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
        @item.save_info
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end 
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
        @item.save_info
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.image.destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :stock, :image, category_elements: [],  animal_elements: [],  size_elements: [])
    end
end
