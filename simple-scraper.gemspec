lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple/scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple-scraper'
  spec.version       = Simple::Scraper::VERSION
  spec.authors       = ['Igor Tikhonenko']
  spec.email         = ['tikhonenkoigor@gmail.com']

  spec.summary       = 'Library for parsing/scraping web pages.'
  spec.description   = 'Library was built on top of nokogiri, parallel and httparty gems that do most of the work'
  spec.homepage      = 'https://github.com/codica2/simple-scraper'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.5'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_dependency 'httparty', '~> 0.16.4'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'parallel', '~> 1.11'
end
