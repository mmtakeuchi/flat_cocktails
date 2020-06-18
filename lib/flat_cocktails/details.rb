class FlatCocktails::Details
    attr_accessor :name, :glass, :ingredients, :instructions

    @@all = []

    def initialize(name:, glass:, ingredients:, instructions:)
        self.name = name
        self.glass = glass
        self.ingredients = ingredients
        self.instructions = instructions
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.reset
        self.all.clear
    end

end