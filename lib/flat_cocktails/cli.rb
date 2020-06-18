class FlatCocktails::CLI

    def call
        puts "Welcome the Flat Cocktails!"
        list_ingredients
        binding.pry
        list_cocktails
        cocktail_details
        run
    end

    def list_ingredients
        puts "Here is our library of ingredients. Please choose a number that matches the ingredient for a cocktail list made with the ingredient."
        FlatCocktails::API.get_ingredients

        FlatCocktails::Ingredients.all.each.with_index(1) do |ingredient, i|
            puts "#{i}: #{ingredient.name}"
        end
      
    end

    def list_cocktails
        input = gets.strip
        # get user input from ingredient list
        # use input to get cocktails from api
        # print cocktail list
    end

    def cocktail_details
        input = gets.strip
        # get user input from cocktails list
        # use input to get cocktail details from api
        # print cocktail details
    end

    def run
        puts "Enter 'menu' if you would like to go back to the ingredients list, 'list' to go back to the cocktail list, and 'exit' to leave the program."
        input = gets.strip

        if input == 'menu'
            list_ingredients
            list_cocktails
            cocktail_details
            run
        elsif input == 'list'
            list_cocktails
            cocktail_details
            run
        elsif input == 'exit'
            goodbye
        else
            puts "Sorry invalid response."
            run
        end
    end
    
    def goodbye
        puts "Thanks for visiting Flat Cocktails!"
        puts "Have a nice day!"
    end

end