class Song < ApplicationRecord
    geocoded_by :address 
    after_validation :geocode, if: :address_changed?
    after_validation :valid_address?
    after_validation :valid_song?

    validates :street, :city, :country, :name, :artist, presence: true
    # validates :valid_address?

    def address
      [street, city, country].compact.join(", ")
    end


  def address_changed?
    street_changed? || city_changed? || country_changed?
  end

  

  def valid_address?
    if latitude.blank? || longitude.blank?
      errors.add(:address, "We couldn't find the address on Google Maps. Please note that you have to write both city and country name in English. And please try again, Google seems to be moody at times with looking up addresses.")
      return false
    else
      return true
    end
  end

  def valid_song?
    if spotifyurl.blank?
      errors.add(:name, "We couldn't find the song on Spotify. Please make sure song title and artist are spelled correct. And please try again, Spotify seems to be moody at times with looking up songs.")
      return false
    else
      return true
    end
  end

end
