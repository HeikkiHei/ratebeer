class BeermappingApi
  def self.places_in(city)
    city = city.downcase
    Rails.cache.fetch(city, expires_in: 1.week) { get_places_in(city) }
  end

  def self.get_places_in(city)
    url = "http://beermapping.com/webservice/loccity/#{key}/"

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(city)}"
    places = response.parsed_response["bmp_locations"]["location"]

    return [] if places.is_a?(Hash) && places['id'].nil?

    places = [places] if places.is_a?(Hash)
    places.map do |place|
      Place.new(place)
    end
  end

  def self.single_place(bar)
    bar = bar.downcase
    Rails.cache.fetch(bar, expires_in: 1.week) {
    url = "http://beermapping.com/webservice/locquery/#{key}/"

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(bar)}"
    place = response.parsed_response["bmp_locations"]["location"]

    return [] if place.is_a?(Hash) && place['id'].nil?
    Place.new(place)
    }
  end

  def self.key
    raise "BEERMAPPING_APIKEY env variable not defined" if ENV['BEERMAPPING_APIKEY'].nil?
    ENV['BEERMAPPING_APIKEY']
  end
end
