Gem::Specification.new do |s|
  s.name        = 'rails-for_select'
  s.version     = '1.0.3'
  s.licenses    = ['MIT']
  s.summary     = "Exposes .for_select for use with Rails forms"
  s.description = "Exposes ActiveRecord::Base.for_select for use with Rails' ActionView::Helpers::FormTagHelper#select_tag"
  s.authors     = ["Emil Kampp"]
  s.email       = 'emil@kampp.me'
  s.files       = ["lib/rails/for_select.rb"]
  s.homepage    = 'https://github.com/ekampp/rails-for_select'
  s.required_ruby_version = '~> 2.2'

  s.add_runtime_dependency 'nokogiri', '>= 1.6'
  s.add_runtime_dependency 'rails', '>= 4.2'
  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.3'
end
