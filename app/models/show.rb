class Show < ActiveRecord::Base
    
    def self.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        self.where("rating = ?", self.highest_rating).first
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.where("rating=", self.lowest_rating).first
    end

    def self.ratings_sum
        self.sum(:ratings)
    end

    def self.popular_shows
        self.where("rating >= ?", 5).all
    end

    def self.shows_by_aphabetical_order
        self.order(:name)
    end
end