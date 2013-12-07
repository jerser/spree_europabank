# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_europabank'
  s.version     = '2.1.2'
  s.summary     = 'ActiveMerchant::Billing::Integration::Europabank'
  s.description = 'ActiveMerchant::Billing::Integration::Europabank'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Jeroen Serpieters'
  s.email     = 'jeroen@serpieters.be'
  s.homepage  = 'https://github.com/jerser/spree_europabank'

  s.files       = Dir['**/*']
  s.test_files  = Dir['spec/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.2'
  s.add_dependency 'active_merchant-europabank'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
