class FlatCocktails::Cocktails
    attr_accessor :name

    @@all = []

    def initialize(name:)
        @name = name
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