module AverageRating
    extend ActiveSupport::Concern
    def average_rating
        return self.ratings.average(:score)
    end
end