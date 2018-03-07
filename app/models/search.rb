class Search < ApplicationRecord

  def search_patients

    patient = Patient.all

    patient = patient.where(["forename ILIKE ?","%#{forename}%"]) if forename.present?
    patient = patient.where(["surname ILIKE ?","%#{surname}%"]) if surname.present?
    patient = patient.where(["town ILIKE ?","%#{town}%"]) if town.present?
    patient = patient.where(["sex ILIKE ?","%#{sex}%"]) if sex.present?
    patient = patient.where(["age ILIKE ?","%#{age}%"]) if age.present?
    patient = patient.where(["postcode ILIKE ?","%#{postcode}%"]) if postcode.present?

    return patient
  end
end
