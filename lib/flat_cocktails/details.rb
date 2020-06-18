class FlatCocktails::Details
    attr_accessor :name, :glass, :ingredients, :instructions

    @@all = []
    
    def self.cocktails(name:, glass:, ingredients:, instructions:)
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

end