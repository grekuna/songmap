class Song < ApplicationRecord
    geocoded_by :address 
    after_validation :geocode, if: :address_changed?
    after_validation :valid_address?

    validates :street, :city, :country, :name, :album, :artist, presence: true
    # validates :valid_address?

    def address
      [street, city, zip, state, country].compact.join(", ")
    end


  def address_changed?
    street_changed? || city_changed? || zip_changed? || state_changed? || country_changed?
  end

  

  def valid_address?
    if latitude.blank? || longitude.blank?
      errors.add(:address, "We couldn't find the address on Google Maps")
      return false
    else
      return true
    end
  end
  

end
