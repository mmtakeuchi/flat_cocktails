module Concerns
    module ClassMethods
        def initialize(name:, glass:, ingredients:, instructions:)
            self.name = name
            self.glass = glass
            self.ingredients = ingredients
            self.instructions = instructions
            self.save
        end

        def reset
            self.all.clear
        end
    end

    module InstanceMethods
        def save
            self.class.all << self
        end
    end
end