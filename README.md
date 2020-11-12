> :warning: **Quick and dirty code here**: This project is my submission to a
  [coding challenge](challenge.md). ~It was written on a strict timeline~ It was
  written with _some_ haste, but mostly I wanted to have fun. I'd be more than
  happy to discuss any part of this solution or my thoughts on the take-home
  challenge as presented to me.

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

There are a number of seed users which can all be accessed with

```
login: email_#{n}@example.com
password: test1234
```
