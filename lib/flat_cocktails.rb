require "pry"
require "rest-client"
require "json"

require_relative "./flat_cocktails/version"
require_relative "./flat_cocktails/api.rb"
require_relative "./flat_cocktails/cli.rb"
require_relative "./flat_cocktails/cocktails.rb"


module FlatCocktails
  class Error < StandardError; end
  # Your code goes here...
end
