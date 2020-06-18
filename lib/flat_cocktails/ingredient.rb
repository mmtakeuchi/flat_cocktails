class FlatCocktails::Ingredients
    attr_accessor :name

    @@all = []

    def initialize(name:)
        self.name = name
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end