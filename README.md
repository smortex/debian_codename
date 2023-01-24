# DebianCodename

A minimalist mixin module for providing debian/ubuntu codename to version translation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'debian_codename'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install debian_codename

## Usage

### find

Given a codename or a version string, `find` will return a hash with the codename, version string, and distribution name:

    require 'debian_codename'

    DebianCodename.find('groovy')
    => {:version=>"20.10", :codename=>"groovy", :distribution=>"ubuntu"}

    DebianCodename.fast_find('12')
    => {:version=>"12", :codename=>"bookworm", :distribution=>"debian"}


### fast_find

Given a codename, `fast_find` will return the corresponding version string and vice-versa.

    require 'debian_codename'

    DebianCodename.fast_find('groovy')
    => "20.10"

    DebianCodename.fast_find('20.10')
    => "groovy"


## Errors

Raises `DebianCodename::DebianCodenameError` if no match is found.

## Development

After checking out the repo, run `bin/setup` to install
dependencies.

Run `rake spec` to run the tests.

Run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
