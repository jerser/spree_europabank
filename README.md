Spree integration for ActiveMerchant::Billing::Integrations::Europabank
===============

This extension integrates the [ActiveMerchant Integration](https://github.com/jerser/active_merchant-europabank)
for [Europabank MPI](https://www.europabank.be/ecommerce-professioneel).

Installation
------------

Add spree_europabank to your Gemfile:

```ruby
gem 'active_merchant-europabank', github: 'jerser/active_merchant-europabank'
gem 'spree_europabank', github: 'jerser/spree_europabank'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_europabank:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_europabank/factories'
```

Copyright (c) 2013 Jeroen Serpieters, released under the MIT License
