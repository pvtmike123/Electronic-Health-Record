class LogsController < ApplicationController
  def index
    @patients = Patient.all.order("updated_at DESC")
    @searches = Search.all.order("updated_at DESC")

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def set_search
    @search = Search.find(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:forename, :surname, :age, :postcode, :sex, :county, :address, :number, :contactmethod, :email, :town, :title, :image)
  end

  def search_params
    params.require(:search).permit(:forename, :surname, :sex, :town, :age, :image, :postcode)
  end
end
