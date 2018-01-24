json.extract! patient, :id, :forename, :surname, :created_at, :updated_at
json.url patient_url(patient, format: :json)
