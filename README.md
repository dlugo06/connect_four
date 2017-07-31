# Connect Four

This project provides a scaffold for a CLI-based Connect Four game in Ruby. It
implements minimal functionality that allows it to run and demonstrate the
game-loop.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Usage

To start a Connect Four game invoke the
following from the command-line (after installing the gem):

    $ connect_four

Two players will be prompted for their names.
Players will then take their turn until the board is full or
one of them plays a winning hand.

If you do not wish to install the gem, you can still run the `connect_four`
executable from within the project directory by invoking:

    $ ./exe/connect_four

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
