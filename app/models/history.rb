class History < ApplicationRecord
  belongs_to :patient
  has_many :events
end
