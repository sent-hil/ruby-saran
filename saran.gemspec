# -*- encoding: utf-8 -*-
require './lib/saran/version'

Gem::Specification.new do |s|
  s.name              = "saran"
  s.version           = Saran::VERSION
  s.authors           = ["sent-hil"]
  s.email             = ["me@sent-hil.com"]
  s.homepage          = "https://github.com/sent-hil/wrappable"
  s.description       = %q{Dsl for wrapping RESTful apis.}
  s.summary           = %q{Dsl for wrapping RESTful apis.}

  s.rubyforge_project = "saran"

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end

  s.require_paths     = ["lib"]

  s.add_dependency 'rake', '~> 0.9.5'
  s.add_dependency 'activesupport', '~> 3.1'

  s.add_development_dependency 'rspec', '~> 2.12'
  s.add_development_dependency 'vcr', '~> 2.3.0'
  s.add_development_dependency 'webmock', '1.8.9'
  s.add_development_dependency 'pry', '~> 0.9.1'

  # = MANIFEST =
  s.files = %w[
    Gemfile
    Rakefile
    Readme.md
    Spec.md
    examples/facebook.rb
    examples/google_cal.rb
    lib/saran.rb
    lib/saran/version.rb
    saran.gemspec
    spec/saran_spec.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =
end
