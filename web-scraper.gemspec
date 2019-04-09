lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'web/scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'web-scraper'
  spec.version       = Web::Scraper::VERSION
  spec.authors       = ['Codica team']
  spec.email         = ['tikhonenkoigor@gmail.com']

  spec.summary       = 'Library for parsing/scraping web pages.'
  spec.description   = 'Library was built on top of nokogiri, parallel and httparty gems.'
  spec.homepage      = 'https://github.com/codica2/web-scraper'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/gems/web-scraper'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/codica2/web-scraper'
    spec.metadata['changelog_uri'] = 'https://github.com/codica2/web-scraper'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

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
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'simplecov'
  spec.add_dependency 'httparty', '~> 0.16.4'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'parallel', '~> 1.11'
end
