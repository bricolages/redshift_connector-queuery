Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'redshift-connector-queuery'
  s.version = '9.0.0'
  s.summary = 'Queuery adapter for redshift-connector'
  s.license = 'MIT'

  s.author = ['Minero Aoki']
  s.email = ['aamine@loveruby.net']
  s.homepage = 'https://github.com/bricolages/redshift-connector-queuery'

  s.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.1.0'
  s.add_dependency 'redshift-connector', '>= 7.0.1'
  s.add_dependency 'redshift-connector-data_file', '>= 7.1.1'
  s.add_dependency 'queuery_client', '~> 0.9.0'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'rake'
end
