class Patient < ApplicationRecord

  belongs_to :user
  has_one :medical
  has_many :notes

  has_attached_file :image, styles: { large: "600x600>", meduim: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
      if search
        where(["forename LIKE ?","%#{search}%"])
      else
        all
      end
  end
end
