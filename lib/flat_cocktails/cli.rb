class FlatCocktails::CLI

    def call
        puts "Welcome the Flat Cocktails!"

        print_ingredients
        list_cocktails
        print_cocktails
        cocktail_details
        print_details
        run
    end

    def print_ingredients
        FlatCocktails::API.get_ingredients
        puts "Here is our library of ingredients."
        sleep 0.75

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
    end

    def print_cocktails
        puts ""

        FlatCocktails::Cocktails.all.each.with_index(1) do |cocktail, i|
            puts "#{i}. #{cocktail.name}"
        end
    end

    def cocktail_details
        puts ""
        print "Select the number for the cocktail you would like to see. "

        input = gets.strip
        if (input.to_i).between?(1, FlatCocktails::Cocktails.all.length)
            details = FlatCocktails::API.get_details(input)
        else
            puts "Sorry that was an invalid number."
            cocktail_details
        end
    end

    def print_details
        FlatCocktails::Details.all.each.with_index(1) do |cocktail, i|
            puts ""
            puts "Name: #{cocktail.name}"
            puts ""
            puts "Glass: #{cocktail.glass}"
            puts ""
            puts "Ingredients: " 
            print_cocktail_ingredients
            puts ""
            puts "Instructions: "
            puts "#{cocktail.instructions}"
            puts ""
        end
    end

    def print_cocktail_ingredients
        FlatCocktails::Details.all.each do |details|
            details.ingredients.each {|ingredient| puts "#{ingredient[0]} #{ingredient[1]}"}
        end
    end

    def run
        puts "Enter 'menu' if you would like to go back to the ingredients list, 'list' to go back to the cocktail list, and 'exit' to leave the program."
        input = gets.strip

        if input == 'menu'
            clear
            print_ingredients
            list_cocktails
            print_cocktails
            cocktail_details
            print_details
            run
        elsif input == 'list'
            FlatCocktails::Details.reset
            print_cocktails
            cocktail_details
            print_details
            run
        elsif input == 'exit'
            goodbye
        else
            puts "Sorry invalid response."
            run
        end
    end
    
    def goodbye
        puts ""
        puts "Thanks for visiting Flat Cocktails!"
        puts "Have a nice day!"
    end

    def clear
        FlatCocktails::Ingredients.reset
        FlatCocktails::Cocktails.reset
        FlatCocktails::Details.reset
    end

end