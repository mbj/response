# -*- encoding: utf-8 -*-

require File.expand_path('../lib/response/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'response'
  gem.version     = Response::VERSION.dup
  gem.authors     = [ 'Markus Schirp' ]
  gem.email       = [ 'mbj@seonic.net' ]
  gem.description = 'Build rack responses with functional style'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/mbj/response'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]

  gem.add_dependency 'ice_nine', '~> 0.4.0'
  gem.add_dependency 'immutable', '~> 0.0.1'
  gem.add_dependency 'equalizer', '~> 0.0.1'
end
