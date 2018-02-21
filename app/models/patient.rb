class Patient < ApplicationRecord

  def self.search(search)
      if search
        where(["forename LIKE ?","%#{search}%"])
      else
        all
      end
  end
end
