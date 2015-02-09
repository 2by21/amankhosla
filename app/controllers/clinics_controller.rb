class ClinicsController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate

  def new
    @clinic = Clinic.new
  end

  def index
    @clinics = Clinic.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to admin_path
    end
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    redirect_to admin_path
  end

  private

    def clinic_params
      params.require(:clinic).permit(:title, :body)
    end
end
