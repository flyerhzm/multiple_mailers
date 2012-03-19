# -*- encoding: utf-8 -*-
require File.expand_path('../lib/multiple_mailers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Richard Huang"]
  gem.email         = ["flyerhzm@gmail.com"]
  gem.description   = %q{extend actionmailer to allow one smtp account per mailer class}
  gem.summary       = %q{extend actionmailer to allow one smtp account per mailer class}
  gem.homepage      = "https://github.com/flyerhzm/multiple_mailers"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "multiple_mailers"
  gem.require_paths = ["lib"]
  gem.version       = MultipleMailers::VERSION

  gem.add_development_dependency "actionmailer"
end
