class TherapiesController < ApplicationController
  class CraniosacralsController < ApplicationController

  def index
    @therapies = Therapy.all
  end

  def show
    @therapy = Therapy.find_by(name: "Gloria")
  end

  def new
    @therapy = Therapy.new
  end

  def edit
    @therapy = Therapy.find_by(name: "Gloria")
  end

  def create
    @therapy = Therapy.new(therapy_params)

    respond_to do |format|
      if @therapy.save
        format.html { redirect_to @therapy, notice: 'Therapist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @therapy }
      else
        format.html { render action: 'new' }
        format.json { render json: @therapy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @therapy = Therapy.find(params[:id])
    respond_to do |format|
      if @therapy.update(therapy_params)
        format.html { redirect_to @therapy, notice: 'Therapist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @therapy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @therapy.destroy
    respond_to do |format|
      format.html { redirect_to therapies_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def therapy_params
      params.require(:therapy).permit(:name, :therapy, :address)
    end
end
