# Yml2erd
[![Build Status](https://travis-ci.org/asmsuechan/yml2erd.svg?branch=master)](https://travis-ci.org/asmsuechan/yml2erd)

yml2erd allows us to generate erd easily.

![output_image](https://raw.githubusercontent.com/asmsuechan/asmsuechan.github.io/master/images/image.png)

When I consider database structure, I wanted erd generator. However there are no tools to fit. So I created.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yml2erd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yml2erd

## Usage
Run this,
```
$ yml2erd convert structure.yml
```
and we get output.png

## Rule
You must write yml just like below

```
<table_name>:
  columns:
    - <column_name>: <column_type>
  relations:
    belongs_to:
      - <table_name>
    has_many:
      - <table_name>
```

belongs_to or has_many is not necessary

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/asmsuechan/yml2erd.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

