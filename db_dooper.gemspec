Gem::Specification.new do |s|
  s.name               = "db_dooper"
  s.version            = "0.0.1"
  s.default_executable = "db_dooper"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Kochel"]
  s.date = %q{2010-04-03}
  s.description = %q{A simple hello world gem}
  s.email = %q{travis@scribbletone.com}
  s.files = ["Rakefile", "lib/db_dooper.rb", "lib/templates/post-checkout", "bin/db_dooper"]
  s.test_files = ["test/test_db_dooper.rb"]
  s.homepage = %q{http://rubygems.org/gems/db_dooper}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Hola!}
  s.add_runtime_dependency 'git', '>= 1.2.8'

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

