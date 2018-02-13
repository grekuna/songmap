class Song < ApplicationRecord
    geocoded_by :address 
    after_validation :geocode, if: :address_changed?

    validates :street, :city, :country, :name, :album, :artist, presence: true

    def address
      [street, city, zip, state, country].compact.join(", ")
    end


  def address_changed?
    street_changed? || city_changed? || zip_changed? || state_changed? || country_changed?
  end

  

end
