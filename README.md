# FlatCocktails

This Ruby Gem shows cocktail recipes from The Cocktail DB database. Going from the initial ingredients list, then selecting through the provided cocktail list made with the selected ingredient, will lead to the cocktail recipe.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flat_cocktails'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install flat_cocktails

## Usage

Run 
```ruby
bin/flat_cocktails
```

Enter numbers to match the list thats presented. After getting the cocktail details, enter another command to either run through the program from the ingredients list again, or back to the cocktail list from the previously selected ingredient. Entering exit will also terminate the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mmtakeuchi/flat_cocktails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mmtakeuchi/flat_cocktails/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FlatCocktails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mmtakeuchi/flat_cocktails/blob/master/CODE_OF_CONDUCT.md).
