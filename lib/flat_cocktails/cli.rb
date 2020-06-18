class FlatCocktails::CLI

    def call
        puts "Welcome the Flat Cocktails!"
        list_ingredients
        
        list_cocktails
        
        cocktail_details
        
        run
    end

    def list_ingredients
        puts ""
        puts "Here is our library of ingredients."
        FlatCocktails::API.get_ingredients

        FlatCocktails::Ingredients.all.each.with_index(1) do |ingredient, i|
            puts "#{i}: #{ingredient.name}"
        end
      
    end

    def list_cocktails
        puts ""
        print "Please choose a number that matches the ingredient for a cocktail list made with the ingredient. "

        input = gets.strip
        if (input.to_i).between?(1, FlatCocktails::Ingredients.all.length)
            FlatCocktails::API.get_cocktails(input)
        else
            puts "Sorry that was an invalid number."
            list_cocktails
        end

        FlatCocktails::Cocktails.all.each.with_index(1) do |cocktail, i|
            puts "#{i}. #{cocktail.name}"
        end
    end

    def cocktail_details
        puts ""
        print "Select the number for the cocktail you would like to see. "

        input = gets.strip
        if (input.to_i).between?(1, FlatCocktails::Cocktails.all.length)
            FlatCocktails::API.get_details(input)
        else
            puts "Sorry that was an invalid number."
            cocktail_details
        end

            FlatCocktails::Details.all.each.with_index(1) do |cocktail, i|
                puts ""
                puts "\nName: #{cocktail.name}"
                puts "\nGlass: #{cocktail.glass}"
                puts "\nIngredients: #{cocktail.ingredients}"
                puts "\nInstructions: #{cocktail.instructions}"
                puts ""
            end
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