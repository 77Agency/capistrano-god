lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-god"
  gem.version       = '0.0.1'
  gem.authors       = ["Andrea Maria Piana"]
  gem.email         = ["a.piana@77agency.com"]
  gem.description   = "Godfiles deployment"
  gem.summary       = "Compile and deploys god and god.erb files"
  gem.homepage      = "https://github.com/77agency/capistrano-god"
  gem.license       = "GPL 2.0"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'capistrano', '~> 3.1', '>= 3.1.0'
end
