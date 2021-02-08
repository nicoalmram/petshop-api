class FakeProfessionalsController < ApplicationController
  before_action :set_fake_professional, only: [:show, :edit, :update, :destroy]

  # GET /fake_professionals
  # GET /fake_professionals.json
  def index
    @fake_professionals = FakeProfessional.all
  end

  # GET /fake_professionals/1
  # GET /fake_professionals/1.json
  def show
  end

  def json_url
    @animal = Animal.all.with_attached_banner
    render json: @animal.map { |animal|
      animal.as_json.merge({ banner: url_for(animal.banner) })
    }
  end

  # GET /fake_professionals/new
  def new
    @fake_professional = FakeProfessional.new
  end

  # GET /fake_professionals/1/edit
  def edit
  end

  def json_url
    @professional = FakeProfessional.all.with_attached_image
    render json: @professional.map { |professional|
      professional.as_json.merge({ image: url_for(professional.image) })
    }
  end

  # POST /fake_professionals
  # POST /fake_professionals.json
  def create
    @fake_professional = FakeProfessional.new(fake_professional_params)

    respond_to do |format|
      if @fake_professional.save
        format.html { redirect_to @fake_professional, notice: 'Fake professional was successfully created.' }
        format.json { render :show, status: :created, location: @fake_professional }
      else
        format.html { render :new }
        format.json { render json: @fake_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fake_professionals/1
  # PATCH/PUT /fake_professionals/1.json
  def update
    respond_to do |format|
      if @fake_professional.update(fake_professional_params)
        format.html { redirect_to @fake_professional, notice: 'Fake professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @fake_professional }
      else
        format.html { render :edit }
        format.json { render json: @fake_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fake_professionals/1
  # DELETE /fake_professionals/1.json
  def destroy
    @fake_professional.destroy
    respond_to do |format|
      format.html { redirect_to fake_professionals_url, notice: 'Fake professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_professional
      @fake_professional = FakeProfessional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fake_professional_params
      params.require(:fake_professional).permit(:name, :comment, :image)
    end
end
