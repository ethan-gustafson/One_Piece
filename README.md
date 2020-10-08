# One Piece
### This is a command line interface that will introduce you to the worlds best selling manga and anime, One Piece!
![Imgur_One_Piece](https://i.imgur.com/njfm5wA.jpg)

## Installation
NOTE: If you would like to run this application, you will have to:

1. Make sure Ruby is installed on your system.
2. Make sure Bundle is installed on your system. You can install it with `gem install bundler` -> https://bundler.io/
2. Clone or download this repository. 
3. `cd` into the CLI directory.
4. Run `bundle install`
5. Run `ruby ./bin/onepiece` or `./bin/onepiece`

If you wish to run the application, it can be found here at [Repl.it](https://repl.it/@GoodGuyGuf/OnePiece).

If you would just like to watch the YouTube presentation, watch here: https://youtu.be/ZpQEJLfSebA

## Usage
The CLI includes the anime's characters, devil fruits information, haki description, episode count and where to watch the show!

## Development
This CLI was finished in December 2019.

## IMPORTANT NOTE
Spec tests are ***only*** functional when ran individually. Running all spec tests at once will fail most, if not *all* tests. This has to do with the `scraper_spec.rb/menu_spec.rb` files. When all specs are run, `SocketErrors` appears on all failed tests:

```ruby
  SocketError:
    Failed to open TCP connection to onepiece.fandom.comhttps:443 (getaddrinfo: nodename nor servname provided, or not known)
```

The only way that `scraper_spec.rb` could function normally was with a `before(:all)` block:

```ruby
  before(:context) do
    SCRAPER = Scraper.new
  end
```

`let` & `subject` would not work for this spec. Instantiating and testing a new Scraper instance takes a long time & will not return correct values.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GoodGuyGuf/one_piece. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the OnePiece project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/GoodGuyGuf/one_piece/blob/master/CODE_OF_CONDUCT.md).
