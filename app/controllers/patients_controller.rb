class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all.order('updated_at ASC').where(user_id: current_user.id)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit;
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @note = @patient.notes.build(params[:patient_id]) # .build used for has many (more than one record)
    @history = @patient.create_history(params[:patient_id]) # .create used for has one relationship
    @medical = @patient.create_medical(params[:patient_id])
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully removed.', class: 'destroy' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:forename, :surname, :age, :postcode, :sex, :county, :address, :number, :contactmethod, :email, :town, :title, :image)
  end

  def set_medical
    @medical = Medical.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medical_params
    params.require(:medical).permit(:allergies, :smoker)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:notes).permit(:title, :body)
  end
end
