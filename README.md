> :warning: **Quick and dirty code here**: This project is a coding challenge
  written on a strict timeline. Take this code with a grain of salt, but I would
  be happy to discuss any concerns.

# WhySpace

WhySpace is a barebones social media clone. It's a Ruby on rails project which
uses Devise for login and Bitly as a link shortener to create member profiles.

## Installation

You will need a Bitly API key before getting started.

- Install Ruby 2.7
- Install Bundler 2.1.4
- `bundle`
- `bin/rake db:setup`
- `export BITLY_API_KEY=...`
- `bin/rails s`
