class FlatCocktails::Details
    attr_accessor :name, :glass, :ingredients, :measures, :instructions

    @@all = []

    def initialize(name:, glass:, ingredients:, measures:, instructions:)
        self.name = name
        self.glass = glass
        self.ingredients = ingredients
        self.measures = measures
        self.instructions = instructions
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end