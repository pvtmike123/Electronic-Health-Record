class Search < ApplicationRecord

  def search_patients

    patient = Patient.all

    patient = patient.where(["forename LIKE ?","%#{forename}%"]) if forename.present?
    patient = patient.where(["surname LIKE ?","%#{surname}%"]) if surname.present?
    patient = patient.where(["town LIKE ?","%#{town}%"]) if town.present?
    patient = patient.where(["sex LIKE ?","%#{sex}%"]) if sex.present?
    patient = patient.where(["age LIKE ?","%#{age}%"]) if age.present?
    patient = patient.where(["postcode LIKE ?","%#{postcode}%"]) if postcode.present?

    return patient
  end
end
